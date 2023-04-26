class Wagon
  include Company, Accessor
  attr_accessor_with_history :volume, :current_volume, :type

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
    print @current_volume_history
  end

  def unoccupied_volume
    volume - current_volume
  end
end
