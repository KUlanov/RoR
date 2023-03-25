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
    if type_train == "Passenger" << Train_Passenger.new(number_train, type_train, wagons)
    else nill
    end
  end

  def add_route(f_station, l_station)
    self.route_lists << Route.new(f_station, l_station)    
  end

end