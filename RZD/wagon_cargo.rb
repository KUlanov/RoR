class WagonCargo < Wagon
  include Company, Accessor
  
  def initialize(type, vol)
    super
    @type = 'Cargo'
  end
end
