class Station
  include InstanceCounter, Validation
  attr_accessor :name, :train_list

  @@station_list = []

  #validate :name, :type, String
  validate :name, :presence

  def self.all
    @@station_list
  end

  def self.find(name)
    Station.all.find { |station| station.name == name }
  end

  def initialize(name)
    @name = name    
    if valid?      
      @train_list = []    
      @@station_list << self
      register_instance
    end
  end

  def self.station?(i)
    raise puts 'Такой станции не существует' if Station.all[i].nil? || i.negative?
  end

  def input_train(train)
    train_list << train
    puts "Поезд № #{train.number} прибыл на станцию #{name}"
  end

  def output_train(train)
    train_list.delete(train)
    puts "Поезд № #{train.number} убыл со станции #{name}"
  end

  def show_train_list
    train_list.each do |train|
      puts train.number
      train.show_wagon_list
    end
  end

  def block_train_list(&block)
    train_list.each { |train| block.call(train) }
  end

  def show_train_tips(type); end
end
