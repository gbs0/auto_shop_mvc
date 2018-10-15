class Customer
  attr_accessor :id
  attr_reader :name, :driver_license

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @driver_license = attributes[:driver_license]
  end
end