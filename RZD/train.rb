class Train
  include Company
  attr_reader :number, :type_train, :train_wagon_list
  attr_accessor :speed, :route

  @@train_all=[]
  def self.train_all
    @@train_all
  end

  def self.find(number)
    Train.train_all.find {|train| train.number == number}
  end

  def initialize(number_train, type_train, wagons) 
    @number = number_train
    @type_train = type_train
    @train_wagon_list = [1 ... wagons]
    @speed = 0
    route = []
    manufactured=""
    @@train_all << self
  end

  def train_wagon_quantity # возвращаем количество вагонов
    self.train_wagon_list.size
  end

  def train_current_station 
    self.route.route_list[@train_station] unless self.train_route_nil?
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
         self.train_wagon_list +=1 
    else 
      puts "Поезд движеться. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if self.speed == 0
         self.train_wagon_list -=1 
    else 
      puts "Поезд движеться. Нельзя отцепить вагоны!"
    end
  end

  def train_route_nil? 
    self.route.nil?
  end

  def add_route(route) #новый маршрут
    self.route = route
    @train_station = 0
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

  def train_station_del #Убираем поезд с текущей станции
    self.route.route_list[@train_station].output_train(self)
  end


end