module Accessor
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods    
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        name_history = "@#{name}_history"
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          array = instance_variable_get(name_history) || []
          array << instance_variable_get(var_name)
          instance_variable_set(name_history, array)
          instance_variable_set(var_name, value)
        end
        define_method("#{name}_history") { instance_variable_get(name_history) }
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
  end

  module InstanceMethods
  end
end