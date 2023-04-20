class Station
  include InstanceCounter
  attr_accessor :name, :train_list

  @@station_list = []

  def self.all
    @@station_list
  end

  def self.find(name)
    Station.all.find { |station| station.name == name }
  end

  def initialize(name)
    @name = name
    @train_list = []
    validate!
    @@station_list << self
    register_instance
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

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def validate!
    raise puts 'Название станции не должно быть пустым!' if name.empty?
    raise puts 'Даннаяая станция уже существует' if Station.find(name)
  end
end
