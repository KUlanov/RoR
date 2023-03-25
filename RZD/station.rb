class Station
  
  attr_accessor :name, :train_list

  def initialize(name)
    self.name = name
    self.train_list = []    
  end

  def input_train(train)
    self.train_list << train
  end

  def output_train(train)
    self.train_list.delete(train)
  end

  def show_train_list
    self.train_list.each {|train| puts train.number}
  end

  def show_train_tips(type)
    
  end
end
