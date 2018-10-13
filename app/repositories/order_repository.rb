=begin
    should fill the `@orders` with instance of `Order`, setting the correct types on each property (FAILED - 79)
  #undelivered_orders
    should return all the undelivered orders (FAILED - 80)
  #add
    should add an order to the in-memory list (FAILED - 82)
    should set the new order id (FAILED - 83)
    should start auto-incrementing at 1 if it is the first order added (FAILED - 84)
    should save each new order in the CSV (first row = headers) (FAILED - 85)
=end

require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository )
    @orders = []
    @csv_file = csv_file
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @orders
  end

  def add(order)
    # Set the meal id
    order.id = @next_id
    @orders << order
    save_csv
    @next_id += 1
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? == true }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      customer    = @customer_repository.find(row[:customer_id].to_i)
      employee    = @employee_repository.find(row[:employee_id].to_i)
      meal        = @meal_repository.find(row[:meal_id].to_i)
      @orders << Order.new(id: row[:id].to_i, delivered: row[:delivered] == 'true',
        meal: meal, employee: employee, customer: customer)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |file|
      file << [:id, :delivered, :meal_id, :employee_id, :customer_id ]
      @orders.each do |order|
        file << [order.id, order.delivered?, order.meal.id,
        order.employee.id, order.customer.id]
      end
    end
  end


end

