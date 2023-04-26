class WagonPassenger < Wagon  
  include Company, Accessor
  attr_accessor :pass, :current_pass

  def initialize(type, pass)
    super
    @type = 'Passenger'
  end

  def add_pass
    if unoccupied_volume.positive?
      self.current_volume += 1
    else
      puts 'Превышено количество мест!'
    end    
  end
end
