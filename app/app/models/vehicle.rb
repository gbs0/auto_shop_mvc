class Vehicle
  attr_accessor :id
  attr_reader :brand, :model, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @brand = attributes[:brand]
    @model = attributes[:model]
    @price = attributes[:price]
  end
end