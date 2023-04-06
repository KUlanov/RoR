class Rzd

  attr_accessor :station_lists, :route_lists, :train_cargo_lists, :train_passenger_lists

  @type_train

  def initialize
    @route_lists = []
    @train_cargo_lists = []
    @train_passenger_lists = []
     end

  def add_station(name)
    Station.new(name)
  end  

  def add_train(number_train, type_train, wagons)
    if type_train == "Cargo"
      self.train_cargo_lists << Train_Cargo.new(number_train, type_train, wagons)
    elsif type_train == "Passenger" 
      self.train_passenger_lists<< Train_Passenger.new(number_train, type_train, wagons)
    else nil
    end
  end

  def add_route(f_station, l_station)
    self.route_lists << Route.new(f_station, l_station)    
  end

  def show_station_lists
    puts
    puts "Существующие станции:"
    Station.all.each { |stations| puts "№#{Station.all.index(stations)+1} : #{stations.name}" }
    puts Station.instance
  end

  def show_train_lists
    puts
    puts "Пассажирские поезда:"
    self.train_passenger_lists.each do |train| 
      print "№#{self.train_passenger_lists.index(train)+1} : #{train.number}."
      print " Количество вагонов: #{train.train_wagon_quantity}"
      print "   Текущая станция: #{train.train_current_station.name}" if train.train_current_station
      puts Train_Passenger.instance
    end
    puts "Грузовые поезда:"
    self.train_cargo_lists.each  do |train| 
      print "№#{self.train_cargo_lists.index(train)+1} : #{train.number}" 
      print " Количество вагонов: #{train.train_wagon_quantity}"
      print "   Текущая станция: #{train.train_current_station.name}" if train.train_current_station
      puts Train_Cargo.instance
    end
  end


  def show_route_lists
    puts
    puts "Действующие маршруты:"
    self.route_lists.each do |route| 
      print "№#{self.route_lists.index(route)+1} :"
      route.show_route_list 
    end
    puts Route.instance
  end

  def insert_type_train
    print "Введите тип поезда. 1 - пасажирский. 2 - грузовой: "
    type = gets.to_i
    if type == 1 
      @type_train = "Passenger"
    elsif type == 2 
      @type_train = "Cargo"
    end    
  end

  def select_train
    self.show_train_lists
    self.insert_type_train          
    print "Введите порядковый номер поезда: "
    i = gets.to_i-1
    if @type_train == "Cargo" 
      @current_train = self.train_cargo_lists[i]
    elsif @type_train == "Passenger"
      @current_train = self.train_passenger_lists[i]
    end
  end

  def start_menu
    loop do
      puts "С чем вы хотите работать? Введите номер меню."
      puts "1. Станции"
      puts "2. Маршруты"
      puts "3. Поезда"
      puts "0. Выход"
      input = gets.to_i
      if input == 1 
        self.staion_menu
      elsif input == 2 
        self.route_menu
      elsif input == 3 
        self.train_menu
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
        print "Введите название станции:"
        self.add_station(gets.chomp)
      elsif input == 2 
        print "Введите номер станции."
        n=gets.to_i
        self.station_lists[n].show_train_list
      elsif input == 0 
        break
      end
    end
  end

  def route_menu
    loop do
      self.show_route_lists
      puts "Что вы хотите сделать?"
      puts "1. Добавить маршрут"
      puts "2. Добавить станцию к маршруту"
      puts "3. Удалить станцию из маршрута"
      puts "0. Выход"

      input = gets.to_i
      if input == 1 
        self.show_station_lists
        print "Введите номер первой станции:"
        station_f = self.station_lists[gets.to_i-1]
        print "Введите номер второй станции:"
        station_l = self.station_lists[gets.to_i-1]
        add_route(station_f, station_l)
      elsif input == 2 
        self.show_route_lists
        self.show_station_lists
        print "Введите номер маршрута."
        i = gets.to_i-1
        print "Введите номер станции."
        station=Station.all[gets.to_i-1]
        self.route_lists[i].add_route_station(station)    
      elsif input == 3 
        self.show_route_lists
        self.show_station_lists
        print "Введите номер маршрута."
        i = gets.to_i-1
        print "Введите номер станции."
        station=Station.all[gets.to_i-1]
        self.route_lists[i].del_route_station(station)    
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
        print "Введите номер поезда: "
        name = gets.chomp
        self.insert_type_train
        print "Введите количество вагонов: "
        wagon = gets.to_i
        
        self.add_train(name, @type_train, wagon)
      elsif input == 2
        self.select_train
        self.show_route_lists
        unless @current_train.train_route_nil?          
          @current_train.train_station_del
        end
        print "Введите номер маршрута: "
        n = gets.to_i-1
        unless @current_train.train_route_nil?          
          @current_train.train_station_del
        end
        @current_train.add_route(show_route_lists[n])        
      elsif input == 3 
        self.select_train
        @current_train.add_wagons              
      elsif input == 4 
        self.select_train
        if @current_train.train_wagon_quantity > 0
          @current_train.del_wagons
        else
          puts "У поезда не может быть отрицательное количество вагонов!"
        end
      elsif input == 5 
        self.select_train
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

end