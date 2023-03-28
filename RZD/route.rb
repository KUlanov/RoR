class Route
  attr_accessor :route_list
  
  def initialize(f_station, l_station)
    @route_list = [f_station, l_station]
  end

  def add_route_station(station)
    self.route_list.insert(-2, station)
  end

  def del_route_station(station)
    if self.route_list.size > 2
    self.route_list.delete(station)
    else 
      puts "В маршруте не может быть меньше 2-х станций"
    end
  end 

  def show_route_list
    self.route_list.each {|station| print " #{station.name}"}     
    puts
  end
end
