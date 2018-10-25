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
    puts ("-" * 10) + 'Patients' + ('-' * 10)
    puts "1. Create Patient"
    puts "2. List Patients"
    puts ("-" * 10) + 'Rooms' + ('-' * 10)
    puts "3. Create Room"
    puts "4. List Rooms"
    puts ("-" * 10) + 'Doctors' + ('-' * 10)
    puts "5. Create Doctor"
    puts "6. List Doctors"
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
