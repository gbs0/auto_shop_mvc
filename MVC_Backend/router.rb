# TODO: implement the router of your app.
class Router
  def initialize(customers_controller, vehicles_controller, orders_controller)
    @customers_controller = customers_controller
    @vehicles_controller = vehicles_controller
    @orders_controller = orders_controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    system "clear"
    puts ("-" * 10) + 'Vehicles' + ('-' * 10)
    puts "1. Create a Vehicle"
    puts "2. List Vehicles"
    puts ("-" * 10) + 'Orders' + ('-' * 10)
    puts "3. Create Order"
    puts "4. List Orders"
    puts ("-" * 10) + 'Costumers' + ('-' * 10)
    puts "5. Create Costumer"
    puts "6. List Costumers"
    puts '-' * 30
    puts "Choose an option:"
  end

  def dispatch(action)
    case action
    when 1 then @vehicles_controller.add
    when 2 then @vehicles_controller.list

    when 3 then @orders_controller.add
    when 4 then @orders_controller.list_my_orders

    when 5 then @customers_controller.add
    when 6 then @customers_controller.list

    end

  end

end
