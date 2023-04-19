module Company
  def output_name_company
    name_company
  end

  def input_name_company(name)
    self.name_company = name
  end

  private

  attr_accessor :name_company
end
