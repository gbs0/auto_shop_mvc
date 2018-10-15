require_relative '../views/orders_view'

class OrdersController

  def initialize(vehicle_repository, employee_repository, customer_repository, order_repository)
    @vehicle_repository = vehicle_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.list(undelivered_orders)
  end

  def add
    @view.list_vehicles(@vehicle_repository.all)
    vehicle = @vehicle_repository.find(@view.ask_vehicle_id)
    @view.list_customers(@customer_repository.all)
    customer = @customer_repository.find(@view.ask_customer_id)
    @view.list_delivery_guys(@employee_repository.all_delivery_guys)
    employee = @employee_repository.find(@view.ask_employee_id)

    order = Order.new(vehicle: vehicle, customer: customer, employee: employee)
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    my_orders = @order_repository.find_by_employee(employee)
    @view.list(my_orders)
  end

  def list_my_undelivered_orders(employee)
    my_undelivered_orders = @order_repository.find_by_employee(employee).reject { |order| order.delivered? }
    @view.list(my_undelivered_orders)
  end

  def mark_as_delivered(employee)
    order = @order_repository.find(@view.ask_order_id)
    order.deliver!
    @order_repository.save_csv
  end

  def divided_price() # Inserir argumento vindo do model de pedidos
    # TODO: Dividir o valor total do veiculo pelo numero N de parcelas 
  end

end