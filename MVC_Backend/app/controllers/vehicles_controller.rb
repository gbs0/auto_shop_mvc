require 'httparty'

require_relative '../views/vehicles_view'

class FipeAPI
  include HTTParty
  base_uri "https://parallelum.com.br/fipe/api/v1/"

  attr_reader :list_brand_for_cars,
  :list_brand_for_bikes,
  :list_brand_for_trucks,
  :brand_car,
  :all

=begin  
  def initialize(csv_file_path)
    @array_recipe = []
    @csv_recipes = csv_file_path
    CSV.foreach(@csv_recipes) do |recipe_line|  
=end

  # def initialize
  #   @brand_cars = []
  #   @brand_bikes = []
  #   @brand_trucks = []
  # end

  def list_brand_for_cars
    self.class.get('/carros/marcas')
    # (FipeAPI.new(car_brand[0], car_brand[1]))
  end


end

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