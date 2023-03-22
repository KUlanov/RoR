class Station
  @@station_list
  def initialize(name)
    @name = name
    @@station_list << @name
  end

  def input_train(train) 
    @train_list << train
  end

  def output_train(train)
    @train_list.delete(train)
  end

  def show_train_list
    @train_list
  end

  def show_train_tips

  end
end


class Route
  def initialize(f_station, l_station)
    @rout_list = [f_station, l_station]
  end

  def add_route_station(station)
    @rout_list.insert(-2, station)
  end

  def del_route_station(station)
    @rout_list.delete(station)
  end 

  def show_rout_list
    @rout_list
  end
end


class Train
  def initialize(number_train, type_train, namber_wagons) 
    @number_train = number_train
    @type_train = type_train
    @namber_wagons = namber_wagons
    @speed = 0
  end

  def speed_train_up
    @speed += 10
  end

  def speed_train
    @speed
  end

  def speed_train_down
    if @speed > 10
      @speed -=10  
    else 
      @speed = 0
    end
  end

  def speed_train_stop
    @speed = 0
  end

  def namber_wagons
    @namber_wagons
  end

  def add_wagons
    if @speed == 0
         @namber_wagons +=1 
    else 
      puts "Поезд движеться. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if @speed == 0
         @namber_wagons -=1 
    else 
      puts "Поезд движеться. Нельзя отцепить вагоны!"
    end
  end

  def add_route(route) #новый маршрут
    @route = route
    @train_station = 0
    @@station_list.each do |i, value|
      if @route[i].show_train_list.include? (self)# проверяем был ли этот поезд уже на одной из станций
        @route[i].output_train(self) # если был удаляем его, т.к. задан новый маршрут
      end
    end
    @route[0].input_train(self)
    
  end

  def train_rout_up
    unless @route.rout_list[@train_station+1] == nill
      @train_station +=1
      @route[@train_station-1].output_train(self)
      @route[@train_station].input_train(self)
    else
      puts "Вы на конечной станции маршрута!"
    end
  end

  def train_rout_down
    if @train_station > 0
      @train_station -=1
      @route[@train_station+1].output_train(self)
      @route[@train_station].input_train(self)
    else
      puts "Вы на первой станции маршрута!"
    end
  end


end