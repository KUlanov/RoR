class Train_Cargo < Train
  include InstanceCounter
  attr_reader :type_train, :train_wagon_list

  def initialize(number_train, type_train, wagons)
    super
    @type_train = "Cargo"
    @train_wagon_list =[]
    (0 ... wagons).each {self.add_wagons}
    register_instance
  end
  
  def add_wagons
    if self.speed == 0
         train_wagon_list << Wagon_Cargo.new
    else 
      puts "Поезд движеться. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if self.speed == 0
      train_wagon_list.delete_at(-1)      
    else 
      puts "Поезд движеться. Нельзя отцепить вагоны!"
    end
  end

end