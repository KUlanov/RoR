class Train
  include Company
  attr_reader :number, :type_train, :train_wagon_list
  attr_accessor :speed, :route

  TYPENUM = /^\w{3}-?\w{2}$/

  @@train_all = []

  def self.train_all
    @@train_all
  end

  def self.find(number)
    Train.train_all.find { |train| train.number == number }
  end

  def initialize(number_train, type_train, wagons)
    @number = number_train
    validate!
    @type_train = type_train
    @train_wagon_list = [1...wagons]
    @speed = 0
    route = []
    manufactured = ''
    @@train_all << self
  end

  def train_wagon_quantity
    train_wagon_list.size
  end

  def train_current_station
    route.route_station[@train_station] unless train_route_nil?
  end

  def speed_train_up
    self.speed += 10
  end

  def speed_train
    @speed
  end

  def speed_train_down
    if speed > 10
      self.speed -= 10
    else
      self.speed = 0
    end
  end

  def speed_train_stop
    self.speed = 0
  end

  def block_wagons_list(&block)
    train_wagon_list.each { |wagon| block.call(wagon) }
  end

  def add_wagons
    if speed.zero?
      self.train_wagon_list += 1
    else
      puts 'Поезд движеться. Нельзя прицепить вагоны!'
    end
  end

  def del_wagons
    if speed.zero?
      self.train_wagon_list -= 1
    else
      puts 'Поезд движеться. Нельзя отцепить вагоны!'
    end
  end

  def train_route_nil?
    route.nil?
  end

  def add_route(route)
    self.route = route
    @train_station = 0
    route.route_station[0].input_train(self)
  end

  def train_route_up
    if route.route_station[@train_station + 1].nil?
      puts 'Вы на конечной станции маршрута!'
    else
      @train_station += 1
      route.route_station[@train_station - 1].output_train(self)
      route.route_station[@train_station].input_train(self)
    end
  end

  def train_route_down
    if @train_station.possitive?
      @train_station -= 1
      route.route_station[@train_station + 1].output_train(self)
      route.route_station[@train_station].input_train(self)
    else
      puts 'Вы на первой станции маршрута!'
    end
  end

  def train_station_del
    route.route_station[@train_station].output_train(self)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def validate!
    raise puts 'Некоректный формат номера поезда!' if number !~ TYPENUM
    raise puts 'Данный номер поезда уже существует' unless Train.find(number).nil?
  end
end
