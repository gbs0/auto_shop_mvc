class CustomersView

  def display(customers)
    # puts "------------------"
    # puts "Avaliable Meals"
    # puts "------------------"
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}: #{customer.driver_license}"
    end
    # puts "------------------"
  end

  def ask_name
    puts "What's your name?"
    gets.chomp
  end

  def ask_address
    puts "What's your address?"
    gets.chomp
  end
end
