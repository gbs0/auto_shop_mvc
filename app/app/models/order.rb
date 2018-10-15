class Order
  attr_accessor :id, :vehicle, :customer, :employee, :total :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @vehicle = attributes[:vehicle]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @total = attributes[:total]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end