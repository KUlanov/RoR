class Rzd

  attr_accessor :station_lists, :route_lists, :train_cargo_lists, :train_passenger_lists

  @type_train
  @current_station
  @current_route
  @current_wagon

  def initialize
    @train_cargo_lists = []
    @train_passenger_lists = []
     end

  def add_station(name)
    Station.new(name)    
  end

  def show_station_lists
    puts
    puts "Существующие станции:"
    Station.all.each { |stations| puts "№#{Station.all.index(stations)+1} : #{stations.name}" }    
  end

  def current_station
    print "Введите номер станции:"
    i= gets.to_i-1
    Station.station?(i)
    @current_station = Station.all[i] 
    rescue StandardError
    retry
  end        

  def add_train(number_train, type_train, wagons)
    if type_train == "Cargo"
      self.train_cargo_lists << Train_Cargo.new(number_train, type_train, wagons)
    elsif type_train == "Passenger" 
      self.train_passenger_lists<< Train_Passenger.new(number_train, type_train, wagons)
    else nil
    end
  end

  def show_train_lists
    puts
    puts "Пассажирские поезда:"
    train_passenger_lists.each do |train| 
      print "№#{self.train_passenger_lists.index(train)+1} : #{train.number}."
      print "   Текущая станция: #{train.train_current_station.name}" if train.train_current_station  
      puts " Количество вагонов: #{train.train_wagon_quantity}"
      
      train.show_wagon_list    
      puts
    end
    puts "Грузовые поезда:"
    train_cargo_lists.each  do |train| 
      print "№#{self.train_cargo_lists.index(train)+1} : #{train.number}" 
      print "   Текущая станция: #{train.train_current_station.name}" if train.train_current_station
      puts " Количество вагонов: #{train.train_wagon_quantity}"
      
      train.show_wagon_list
      puts
    end
  end

  def add_route(f_station, l_station)
    Route.new(f_station, l_station)    
  end
  
  def show_route_lists
    puts
    puts "Действующие маршруты:"
    Route.all.each do |route| 
      print "№#{Route.all.index(route)+1} :"
      route.show_route_list 
    end
  end

  def current_route
    print "Введите номер маршрута:"
    i= gets.to_i-1
    Route.route?(i)
    @current_route = Route.all[i] 
    rescue StandardError
    retry
  end      

  def insert_type_train
    print "Введите тип поезда. 1 - пасажирский. 2 - грузовой: "
    type = gets.to_i
    if type == 1 
      @type_train = "Passenger"
    elsif type == 2 
      @type_train = "Cargo"
    elsif raise puts "Неправильный тип. Выберите один из двух типов!"    
    end    
  rescue StandardError  
    retry
  end

  def select_train
    self.show_train_lists
    self.insert_type_train          
    print "Введите порядковый номер поезда: "
    i = gets.to_i-1
    if @type_train == "Cargo" 
      @current_train = train_cargo_lists[i]
    elsif @type_train == "Passenger"
      @current_train = train_passenger_lists[i]
    end
  end

  def select_wagon
    puts "С каким поездом вы хотите работать?"
    select_train
    @current_train.show_wagon_list
    print "С каким вагоном вы хотите работать?"
    i = gets.to_i-1
    @current_wagon = @current_train.train_wagon_list[i]
    raise puts "нет такого вагона!" if @current_wagon.nil?
   rescue StandardError
    retry
  end

  def start_menu
    loop do
      puts "С чем вы хотите работать? Введите номер меню."
      puts "1. Станции"
      puts "2. Маршруты"
      puts "3. Поезда"
      puts "4. Вагоны"
      puts "0. Выход"
      input = gets.to_i
      if input == 1 
        staion_menu
      elsif input == 2 
        route_menu
      elsif input == 3 
        train_menu
      elsif input == 4 
        wagon_menu
      elsif input == 0 
        break
      end
    end
  end

  def staion_menu      
    loop do
      self.show_station_lists
      puts "Что вы хотите сделать?"
      puts "1. Добавить станцию"
      puts "2. Посмотреть список поездов на станции"
      puts "0. Выход"
      input = gets.to_i
      if input == 1 
        begin
        print "Введите название станции:"
        self.add_station(gets.chomp)
        rescue StandardError 
          retry
        end
      elsif input == 2 
        current_station.show_train_list
        #Station.all[n].show_train_list
      elsif input == 0 
        break
      end
    end
  end

  def route_menu
    loop do
      show_route_lists
      puts "Что вы хотите сделать?"
      puts "1. Добавить маршрут"
      puts "2. Добавить станцию к маршруту"
      puts "3. Удалить станцию из маршрута"
      puts "0. Выход"

      input = gets.to_i
      if input == 1 
        show_station_lists
        print "Станция №1: "
        current_station
        station_f=current_station        
        print "Станция №2: "
        #current_station
        station_l=current_station
        add_route(station_f, station_l)
      elsif input == 2 
       begin
        self.show_route_lists
        self.show_station_lists
        station=current_station        
        raise puts "Такая станция уже существует в маршруте"  if current_route.find_station(station)
        rescue StandardError
          retry
        end    
        @current_route.add_route_station(station)    
      elsif input == 3 
       begin 
        self.show_route_lists
        self.show_station_lists        
        station=current_station
        raise puts "Такая станция не существует в маршруте"  unless current_route.find_station(station)
        rescue StandardError
          retry
       end
        @current_route.del_route_station(station)    
      elsif input == 0 
        break
      end
    end
  end

  def train_menu
    loop do
      self.show_train_lists
      puts "Что вы хотите сделать?"
      puts "1. Добавить поезд"
      puts "2. Установить маршрут поезду"
      puts "3. Добавить вагон к поезду"
      puts "4. Убрать вагон у поезда"
      puts "5. Переместить поезда вперед по маршруту"
      puts "6. Переместить поезд назад по маршруту"
      puts "0. Выход"
      
      input = gets.to_i

      if input == 1
      begin
        print "Введите номер поезда: "
        name = gets.chomp        
        insert_type_train
        print "Введите количество вагонов: "
        wagon = gets.to_i
        
        self.add_train(name, @type_train, wagon)
      rescue StandardError 
        #retry
       end
      elsif input == 2
        select_train
        show_route_lists
        print "Введите номер маршрута: "
        n = gets.to_i-1
        unless @current_train.train_route_nil?          
          @current_train.train_station_del
        end
        @current_train.add_route(Route.all[n])        
      elsif input == 3 
        select_train
        @current_train.add_wagons              
      elsif input == 4 
        select_train
        if @current_train.train_wagon_quantity > 0
          @current_train.del_wagons
        else
          puts "У поезда не может быть отрицательное количество вагонов!"
        end
      elsif input == 5 
        select_train
        if @current_train.train_route_nil?
          puts "У поезда не задан маршрут!" 
        else 
          @current_train.train_route_up
        end
      elsif input == 6 
        self.select_train
        if @current_train.train_route_nil?
          puts "У поезда не задан маршрут!" 
        else 
          @current_train.train_route_down
        end
      elsif input == 0 
        break
      end          

    end
  end
 
  def wagon_menu
    loop do
      puts "Что вы хотите сделать?"
      puts "1. Добавить объем/пассажиров"
      puts "0. Выход"
      input = gets.to_i
      if input == 1
        select_wagon
       print "Какое количество объема/пассажиров вы хотите добавить?"
        vol = gets.to_i
        @current_wagon.set_volume(vol)
      elsif input == 0
        break
      end
    end
  end
 

end