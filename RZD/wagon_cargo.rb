class WagonCargo < Wagon
  def initialize(type, vol)
    super
    @type = 'Cargo'
  end
end
