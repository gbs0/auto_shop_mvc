class OrdersView
  def display(orders)
    orders.each do |order|
    puts "#{order.id} - #{order.meal.name} - #{order.employee.username} #{order.customer.name}"
   end
  end

  def ask_employee_id
    puts "What's your employee ID?"
    gets.chomp
  end

  def ask_customer_id
    puts "What's the customer ID?"
    gets.chomp
  end

  def ask_meal_id
    puts "What's the order ID?"
    gets.chomp
  end

  def ask_order_id
    puts "What's the order ID?"
    gets.chomp
  end
end

