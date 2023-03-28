class Train_Passenger < Train
  attr_reader :type_train, :train_wagon_list

  def initialize(number_train, type_train, wagons)
    super
    @type_train = "Passenger"
    @train_wagon_list =[]
    (1 ... wagons).each { @train_wagon_list << Wagon_Passenger.new }
  end

  def add_wagons
    if self.speed == 0
         self.train_wagon_list << Wagon_Passenger.new
    else 
      puts "Поезд движеться. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if self.speed == 0
      self.train_wagon_list.delete_at(-1)
    else 
      puts "Поезд движеться. Нельзя отцепить вагоны!"
    end
  end


end
