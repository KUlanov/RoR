class Wagon_Passenger < Wagon
 
  attr_accessor :pass, :current_pass
  def initialize(type, pass)
    super
    @type = "Passenger" 
    #@pass = pass
    #@current_pass=0
  end
  def set_volume (vol)
    if vol <= unoccupied_volume 
      self.current_volume += 1 
    else 
      puts "Превышено количество мест!"
    end
  end
=begin
  def free_pass
    pass-current_pass
  end
=end

end