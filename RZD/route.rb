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
    self.route_list.each do |station| 
      print " #{station.name}" 
    end
  end
end
