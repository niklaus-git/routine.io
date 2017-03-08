module FieldsHelper
  def choice?(choice, value)
  value.split('//CHOICE//').include? choice
  end
end
