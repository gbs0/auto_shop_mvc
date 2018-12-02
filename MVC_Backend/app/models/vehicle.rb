class Vehicle
  attr_accessor :id, :bought, :code
  attr_reader :brand, :model, :price, :bulletproof 

  def initialize(attributes = {})
    @id = attributes[:id]
    @brand = attributes[:brand]
    @model = attributes[:model]
    @price = attributes[:price]
    @bought = attributes[:bought] || false
    @bulletproof = attributes[:bulletproof] || false
  end

  def bought?
    @bought
  end

  def buyed!
    @bought = true
  end

  def bulletproof?
    @bulletproof
  end

  def bulletproof!
    @bulletproof = true
  end

end