class Station
  include InstanceCounter
  attr_accessor :name, :train_list
  @@station_list=[]

  def self.all
    @@station_list
  end

  def initialize(name)
    self.name = name
    self.train_list = []  
    self.validate!
    @@station_list << self
    self.register_instance        
  end

  def input_train(train)
    self.train_list << train
    puts "Поезд № #{train.number} прибыл на станцию #{self.name}"
  end

  def output_train(train)
    self.train_list.delete(train)
    puts "Поезд № #{train.number} убыл со станции #{self.name}"
  end

  def show_train_list
    self.train_list.each {|train| puts train.number}    
  end

  def show_train_tips(type)
    
  end

  def valid?
    self.validate!
    true
  rescue StandardError
    false
  end

  def validate!
    raise puts 'Название станции не должно быть пустым!' if self.name.empty?    
  end
end
