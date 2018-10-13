class Order
  attr_accessor :id, :meal, :employee, :customer, :delivered

  def initialize(properties = {})
    @id = properties[:id]
    @delivered = properties[:delivered] || false
    @cooked = properties[:cooked] || false
    @meal = properties[:meal]
    @employee = properties[:employee]
    @customer = properties[:customer]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def cooked?
    @cooked 
  end

  def cook!
    @cooked = true
  end
end
