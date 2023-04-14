class Wagon_Passenger < Wagon
 
  attr_accessor :pass, :current_pass
  def initialize(type, pass)
    super
    @type = "Passenger" 
    #@pass = pass
    #@current_pass=0
  end
=begin
  def set_pass (pass)
    current_pass += pass if pass <= free_pass
  end

  def free_pass
    pass-current_pass
  end
=end

end