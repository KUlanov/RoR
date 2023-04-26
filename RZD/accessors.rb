module Accessor
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods    
    def attr_accessor_with_history(*var)
      var.each do |var|
        var_history="@#{var}_history"
        raise TypeError.new("Название переменной некорректно ") unless var.is_a?(Symbol)
        define_method(var) do
          instance_variable_get("@#{var}")
        end
        
        define_method("#{var}=") do |v|          
          instance_variable_set("@#{var}", v)
          a = (instance_variable_get(var_history) || [])<< v
          instance_variable_set(var_history, a)
        end

        define_method(var_history) {instance_variable_get(var_history)}
      end
    end
  end

  def strong_attr_accessor(var, type)
    define_method(var) do
      instance_variable_get("@#{var}")
    end

    define_method("#{var}=") do |v|      
      if v.is_a? type 
        instance_variable_set("@#{var}", v)
      else 
        raise "Не соответствует тип данных"
      end
    end
  end

  module InstanceMethods
  end
end