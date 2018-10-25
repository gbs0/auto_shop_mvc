=begin
CustomersController
  should be initialized with a `CustomerRepository` instance (FAILED - 44)
  #list
    should grab customers from the repo and display them (FAILED - 45)
  #add
    should ask the user for a name and address, then store the new customer (FAILED - 46)
=end
require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    name = @view.ask_name
    drive_license = @view.ask_drive_license
    new_customer = Customer.new(name: name, drive_license: drive_license)
    @customer_repository.add(new_customer)
  end
end
