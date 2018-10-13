require_relative '../views/customers_view'

class CustomersController

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.list(customers)
  end

  def add
    name = @view.ask_name
    driver_license = @view.ask_driver_license
    customer = Customer.new(name: name, driver_license: driver_license)
    @customer_repository.add(customer)
  end
end