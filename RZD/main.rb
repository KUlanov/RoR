class Station
  attr_accessor :name, :train_list

  #@@station_list =[]
  def initialize(name)
    @name = name
    @train_list = []
   # @@station_list << self
  end

  def input_train(train) 
    self.train_list << train
  end

  def output_train(train)
    self.train_list.delete(train)
  end

  def show_train_list
    self.train_list.each {|train| puts train.number}
  end

  def show_train_tips
    @train_list
  end
end


class Route
  attr_accessor :route_list
  
  def initialize(f_station, l_station)
    @route_list = [f_station, l_station]
  end

  def add_route_station(station)
    self.route_list.insert(-2, station)
  end

  def del_route_station(station)
    self.route_list.delete(station)
  end 

  def show_route_list
    self.route_list.each { |station| puts station.name }
  end
end


class Train
  attr_reader :number, :type
  attr_accessor :speed, :route, :wagons
  
  def initialize(number_train, type_train, wagons) 
    @number = number_train
    @type = type_train
    @wagons = wagons
    @speed = 0
  end

  def speed_train_up
    self.speed += 10
  end

  def speed_train
    self.speed
  end

  def speed_train_down
    if self.speed > 10
      self.speed -=10  
    else 
      self.speed = 0
    end
  end

  def speed_train_stop
    self.speed = 0
  end
  
  def add_wagons
    if self.speed == 0
         self.wagons +=1 
    else 
      puts "Поезд движеться. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if self.speed == 0
         self.wagons -=1 
    else 
      puts "Поезд движеться. Нельзя отцепить вагоны!"
    end
  end

  def add_route(route) #новый маршрут
    self.route = route
    @train_station = 0
=begin  
    @@station_list.each do |i, value|
      if @route[i].show_train_list.include? (self)# проверяем был ли этот поезд уже на одной из станций
        @route[i].output_train(self) # если был удаляем его, т.к. задан новый маршрут
      end
    end
=end    
    self.route.route_list[0].input_train(self)
    
  end

  def train_route_up
    unless self.route.route_list[@train_station+1] == nil
      @train_station +=1
      self.route.route_list[@train_station-1].output_train(self)
      self.route.route_list[@train_station].input_train(self)
    else
      puts "Вы на конечной станции маршрута!"
    end
  end

  def train_route_down
    if @train_station > 0
      @train_station -=1
      self.route.route_list[@train_station+1].output_train(self)
      self.route.route_list[@train_station].input_train(self)
    else
      puts "Вы на первой станции маршрута!"
    end
  end


end