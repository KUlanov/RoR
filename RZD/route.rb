class Route
  include InstanceCounter
  attr_reader :route_station
  
  def self.all
    @@route_list
  end

  def self.route?(i)
    raise puts 'Такого маршрута не существует' if Route.all[i].nil? or i<0
  end
  
  def initialize(f_station, l_station)
    @route_station = [f_station, l_station]
    @@route_list << self
    register_instance    
  end

  def add_route_station(station)
    route_station.insert(-2, station)
  end

  def del_route_station(station)
    if route_station.size > 2
     route_station.delete(station)
    else 
      puts "В маршруте не может быть меньше 2-х станций"
    end
  end 

  def show_route_list
    route_station.each {|station| print " #{station.name}"}     
    puts 
  end

  def find_station(station)
    route_station.include? station
  end

  protected
  @@route_list = []
  attr_writer :route_station
end
