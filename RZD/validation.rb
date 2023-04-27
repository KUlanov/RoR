module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods    
    def validate(name, type, param=nil)
      @valid_arr ||= []
      @valid_arr << {name: name, type: type, param: param} 
      puts @valid_arr[0]
    end
  end

  module InstanceMethods
    def validate!
      puts @valid_arr[0]
      self.class.valid_arr.each do |type|
      send(type, var, param)
      end
    end

    def presence (var, v)
      raise "Переменная не может быть пустой!" if (var.empty? && var.is_a?(String)) || var.nil?
    end

    def format(var, format)
      raise puts 'Некоректный формат данных!' if var !~ format
    end

    def type(var, type)
      raise 'Неверный класс атрибута' if var.is_a?(type)
    end
  end
end