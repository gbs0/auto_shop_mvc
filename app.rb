require 'csv'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/vehicle_repository'
require_relative 'app/controllers/vehicles_controller'

require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'

customer_repository = CustomerRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customer_repository)

vehicle_repository = VehicleRepository.new('data/meals.csv')
vehicles_controller = VehiclesController.new(vehicle_repository)

order_repository = OrderRepository.new('data/orders.csv')
orders_controller = OrdersController.new(order_repository)

require_relative 'router'

router = Router.new(customers_controller, vehicles_controller, orders_controller)

# Start the app
router.run
