class Train_Passenger < Train
  include InstanceCounter
  attr_reader :type_train, :train_wagon_list

  def initialize(number_train, type_train, wagons)
    super
    @type_train = "Passenger"
    @train_wagon_list =[]
    (0 ... wagons).each { self.add_wagons }
    register_instance
  end

  def add_wagons
    if self.speed == 0
         train_wagon_list << Wagon_Passenger.new("Passenger", rand(10))
    else 
      puts "Поезд движется. Нельзя прицепить вагоны!"
    end
  end

  def del_wagons
    if self.speed == 0
      train_wagon_list.delete_at(-1)
    else 
      puts "Поезд движется. Нельзя отцепить вагоны!"
    end
  end

  def show_wagon_list
    train_wagon_list.each do |wagon|
      print "Вагон № #{train_wagon_list.index(wagon)+1}, тип: пасажирский,"
      puts " количество занятых мест: #{wagon.current_volume}, количество свободных мест: #{wagon.unoccupied_volume}"
    end
  end
end
