class Wagon_Passenger < Wagon
  attr_accessor :pass, :current_pass

  def initialize(type, pass)
    super
    @type = 'Passenger'
  end

  def add_pass
    if unoccupied_volume.possitive?
      self.current_volume += 1
    else
      puts 'Превышено количество мест!'
    end
  end
end
