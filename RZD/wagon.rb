class Wagon
  include Company
  attr_reader :type
  attr_accessor :volume, :current_volume

  def initialize(type, vol)
    @type = type
    @volume = vol
    @current_volume = 0
  end

  def set_volume(vol)
    if vol <= unoccupied_volume
      self.current_volume += vol
    else
      puts 'Превышено количество места!'
    end
  end

  def unoccupied_volume
    volume - current_volume
  end
end
