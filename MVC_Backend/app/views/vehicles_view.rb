require 'httparty'

class VehiclesView


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
    include HTTParty
    base_uri "https://parallelum.com.br/fipe/api/v1/"
    puts "Vehicle brand?"
    # gets.chomp
    p self.class.get('/carros/marcas')
    # (FipeAPI.new(car_brand[0], car_brand[1]))
  end

  def list_vehicle

  end

  def ask_price
    puts "vehicle price?"
    gets.chomp.to_i
  end
end
