class Wagon_Cargo < Wagon
  
  def initialize (vol)
    @type = "Cargo"
    @volume = vol
    @current_volume=0
  end

  def set_volume (vol)
    curent_volume += vol if vol <= unoccupied_volume
  end

  def current_volume
    self.current_volume
  end

  def unoccupied_volume
    volume-current_volume
  end

protected
attr_accessor :volume, :current_volume
end
