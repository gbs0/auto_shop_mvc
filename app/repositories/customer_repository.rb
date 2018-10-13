=begin
CustomerRepository
  #initialize
    should take one argument: the CSV file path to store customers (FAILED - 31)
    should not crash if the CSV path does not exist yet. Hint: use File.exist? (FAILED - 32)
    should store customers in memory in an instance variable `@customers` or `@elements` (FAILED - 33)
    should load existing customers from the CSV (FAILED - 34)
    should fill the `@customers` with instances of `Customer`, setting the correct types on each property (FAILED - 35)
  #all
    should return all the customers stored by the repo (FAILED - 36)
    CustomerRepository should not expose the @customers through a reader/method (FAILED - 37)
  #add
    should add a customer to the in-memory list (FAILED - 38)
    should set the new customer id (FAILED - 39)
    should start auto-incremting at 1 if it is the first customer added (FAILED - 40)
    should save each new customer in the CSV (first row = headers) (FAILED - 41)
  #find
    should retrieve a specific customer based on its id (FAILED - 42)\
=end
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(customer)
    # Set the meal id
    customer.id = @next_id
    @customers << customer
    save_csv
    @next_id += 1
  end

  def all
    @customers
  end

  def find(id)
    @customers.select { |clients| clients.id == id }.first
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |file|
      file << [:id, :name, :address]
      @customers.each do |customer|
        file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
