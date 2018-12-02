require_relative '../views/vehicles_view'

class VehiclesController
  def initialize(vehicle_repository)
    @vehicle_repository = vehicle_repository
    @view = VehiclesView.new
  end

  def list
    vehicles = @vehicle_repository.all
    @view.list(vehicles)
  end

  def add
    name = @view.ask_name
    price = @view.ask_price
    vehicle = vehicle.new(brand: brand, model: model, price: price)
    @vehicle_repository.add(vehicle)
  end
  
end