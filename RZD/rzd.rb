class Rzd

  attr_accessor :station_lists, :route_lists, :train_cargo_lists, :train_passenger_lists

  def initialize
    @station_lists = []
    @route_lists = []
    @train_cargo_lists = []
    @train_passenger_lists = []
  end

  def add_station(name)
    self.station_lists << Station.new(name)
  end  

  def add_train(number_train, type_train, wagons)
    if type_train == "Cargo"
      self.train_cargo_lists << Train_Cargo.new(number_train, type_train, wagons)
    elsif self.type_train == "Passenger" << Train_Passenger.new(number_train, type_train, wagons)
    else nill
    end
  end

  def add_route(f_station, l_station)
    self.route_lists << Route.new(f_station, l_station)    
  end

  def show_station_lists
    self.station_lists.each { |station| puts "#{self.station_lists.index(station)} : #{station.name}" }
  end

  def show_route_lists
    self.route_lists.each do |route| 
      print "#{self.route_lists.index(route)} :"
      puts "#{route.show_route_list}!" 
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
    self.show_station_lists
    loop do
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
    self.show_route_lists
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
        station_f = self.station_lists[gets.to_i]
        print "Введите номер второй станции:"
        station_l = self.station_lists[gets.to_i]
        add_route(station_f, station_l)
      elsif input == 2 
        self.show_route_lists
        print "Введите номер маршрута."
        i = gets.to_i
        print "Введите номер станции."
        n=gets.to_i
        self.route_lists[gets.to_i].add_route_station(n)        
      elsif input == 0 
        break
      end
    end

  end


end