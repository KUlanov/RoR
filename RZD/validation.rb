module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(var, type, param=nil)
    end

    def valid_presence (var)
      raise "Переменная не может быть пустой!" if (var.empty? && var.is_a?(String)) || var.nil?
    end

    def valid_format(var, format)
      raise puts 'Некоректный формат данных!' if var !~ format
    end
    def valid_type(var, type)
      raise 'Неверный класс атрибута' if var.is_a?(type)
    end
  end

  module InstanceMethods
    def validate!
      
    end