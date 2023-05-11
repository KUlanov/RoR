module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods    
    attr_reader :valid_arr
    def validate(name, type, param=nil)
      @valid_arr ||= []
      @valid_arr << {name: name, type: type, param: param}      
    end
  end

  module InstanceMethods
    def validate!
      if self.class.superclass == Object
        source = self.class
      else
        source = self.class.superclass
      end      
      source.instance_variable_get(:@valid_arr).each do |t|        
        var = instance_variable_get("@#{t[:name]}")
        send(:"#{t[:type]}", var, t[:param])
      end    
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end

  def presence (var, v)
    raise puts "Переменная не может быть пустой!" if var.empty? && var.is_a?(String)
  end

  def format(var, format)
    raise puts 'Некоректный формат данных!' if var !~ format
  end

  def type(var, type)
    raise puts "Неверный класс атрибута" unless var.is_a?(type)
  end  
end