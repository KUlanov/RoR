module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instance
  end

  module InstanceMethods
    def register_instance
      self.class.instance = 0 if self.class.instance.nil?
      self.class.instance += 1
    end
  end
end
