=begin
    should take one argument: the CSV file path to store employees (FAILED - 54)
    should load existing employees from the CSV (FAILED - 57)
    fills the `@employees` with instance of `Employee`, setting the correct types on each property (FAILED - 58)
  #all_delivery_guys
    should return all the delivery guys stored by the repo (FAILED - 59)
    EmployeeRepository should not expose the @employees through a reader/method (FAILED - 60)
  #find_by_username
    should retrieve a specific employee based on its username (FAILED - 62)
=end
require_relative '../models/employee'


class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv if File.exist?(@csv_file)
  end

  def all
    @employees
  end

  def find_by_username(username)
   @employees.find { |employ| employ.username == username }
  end

  def find(id)
    @employees.find { |employ| employ.id == id }
  end

  def all_delivery_guys
    @employees.select { |employ| employ.role == 'delivery_guy' }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i       # Convert column to Integer
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
end
