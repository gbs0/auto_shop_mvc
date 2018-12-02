require 'httparty'
require 'json'

class VehiclesView
  include HTTParty
  base_uri "https://parallelum.com.br/fipe/api/v1/"

  def display(vehicles)
    # puts "------------------"
    # puts "Avaliable vehicles"
    # puts "------------------"
    vehicles.each do |vehicle|
      puts "#{vehicle.id} - #{vehicle.name}: R$#{vehicle.price}"
    end
    # puts "------------------"
  end

  def ask_brand
    puts "Vehicle brand?"
    # gets.chomp
    list_vehicle
  end

  def list_vehicle 
    response = self.class.get('/carros/marcas')
    # (FipeAPI.new(car_brand[0], car_brand[1]))
    # JSON.parse(get_response)
    # Parse response as Array
    response.each do |hash|
      print "# #{hash['codigo']} | #{hash['nome']} \n"
    end
  end

  def ask_price
    puts "vehicle price?"
    # gets.chomp.to_i
  end
end
