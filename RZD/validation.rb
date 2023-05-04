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
      puts @valid_arr
    end
  end

  module InstanceMethods
    def validate!      
      self.class.instance_variable_get(:@valid_arr).each do |t|        
        var = instance_variable_get("@#{t[:name]}")
        print var, "@#{t[:name]}"
        puts
        send(:"#{t[:type]}", var, t[:param]) 
      end
    end

    def presence (var, v)
      puts var
      raise "Переменная не может быть пустой!" if var.empty? && var.is_a?(String) #|| var.nil?)
    end

    def format(var, format)
      raise puts 'Некоректный формат данных!' if var !~ format
    end

    def type(var, type)
      raise 'Неверный класс атрибута' if var.is_a?(type)
    end
  end
end