class OrdersView

  def ask_vehicle_id
    puts "Enter vehicle ID:"
    gets.chomp.to_i
  end

  def ask_customer_id
    puts "Enter customer ID:"
    gets.chomp.to_i
  end

  def ask_employee_id
    puts "Enter employee ID:"
    gets.chomp.to_i
  end

  def ask_order_id
    puts "Enter order ID:"
    gets.chomp.to_i
  end

  def list(orders)
    orders.each do |order|
      puts "(##{order.id})  #{order.customer.name} buyed #{order.vehicle.name} selt by #{order.employee.username}"
    end
  end

  def list_vehicles(vehicles)
    vehicles.each do |vehicle|
      puts "##{vehicle.id} #{vehicle.name} #{vehicle.price}"
    end
  end

  def list_customers(customers)
    customers.each do |customer|
      puts "##{customer.id} #{customer.name}"
    end
  end

  def list_delivery_guys(delivery_guys)
    delivery_guys.each do |delivery_guy|
      puts "##{delivery_guy.id} #{delivery_guy.username}"
    end
  end

end

