require_relative '../models/vehicle'

class VehicleRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

  def initialize(csv_file)
    @csv_file = csv_file
    @vehicles = []
    load_csv
  end

  def add(vehicle)
    vehicle.id = @next_id
    @next_id += 1
    @vehicles << vehicle
    save_csv
  end

  def all
    @vehicles
  end

  def find(id)
    @vehicles.select { |vehicle| vehicle.id == id }.first
  end


  def load_csv
    if File.exist?(@csv_file)
      CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
        vehicle = vehicle.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i)
        @vehicles << vehicle
      end
    end

    @next_id = @vehicles.empty? ? 1 : @vehicles.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|
      file << [:id, :name, :price]
      @vehicles.each do |vehicle|
        file << [vehicle.id, vehicle.name, vehicle.price]
      end
    end
  end

  def json_parse
    # TODO
  end


end