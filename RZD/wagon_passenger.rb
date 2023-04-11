class Wagon_Passenger < Wagon
  
  def initialize(pass)
    @type = "Passenger" 
    @pass = pass
    @current_pass=0
  end

  def set_pass (pass)
    current_pass += pass if pass <= free_pass
  end

  def current_pass
    self.current_pass
  end

  def free_pass
    pass-current_pass
  end

protected
attr_accessor :pass, :current_pass
end