class Route
  include InstanceCounter
  attr_accessor :route_station
  @@route_list = []

  def self.all
    @@route_list
  end
  
  def initialize(f_station, l_station)
    @route_station = [f_station, l_station]
    @@route_list << self
    self.register_instance    
  end

  def add_route_station(station)
    self.route_station.insert(-2, station)
  end

  def del_route_station(station)
    if self.route_list.size > 2
    self.route_station.delete(station)
    else 
      puts "В маршруте не может быть меньше 2-х станций"
    end
  end 

  def show_route_list
    self.route_station.each {|station| print " #{station.name}"}     
    puts
  end
end
