
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    # should list undelivered orders (with meal, employee assigned and customer info)
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def add
    MealsController.new(@meal_repository).list
    meal_id = @view.ask_meal_id
    meal = @meal_repository.find(meal_id)

    EmployeeController.new(@employee_repository).list
    employee_id = @view.ask_employee_id
    employee = @employee.find(employee_id)

    CustomerController.new(@customer_repository).list
    customer_id = @view.ask_customer_id
    customer = @customer.find(customer_id)

    new_order = Order.new(meal: meal, employee: employee, customer: customer)
    @order_repository.add(new_order)
  end

  def list_my_orders(employee_repository)
    employee = @employee_repository
    # should take an Employee instance as a parameter
    # should list John's undelivered orders
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_id = @view.ask_order_id
    order.deliver!
    @order_repository.save
    # should take an Employee instance as a parameter
    # should ask the delivery guy for an order id and mark it as delivered
  end
end
