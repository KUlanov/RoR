class Wagon_Cargo < Wagon
  
  def initialize (type, vol)
    super
    @type = "Cargo"    
   # @volume = vol
    #@current_volume=0
  end
=begin
  def set_volume (vol)
    curent_volume += vol if vol <= unoccupied_volume
  end

  def unoccupied_volume
    volume-current_volume
  end
=end

end
