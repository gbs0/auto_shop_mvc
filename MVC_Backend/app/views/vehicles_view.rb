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
    # response = self.class.get('/carros/marcas')
    # # (FipeAPI.new(car_brand[0], car_brand[1]))
    # # JSON.parse(get_response)
    # # Parse response as Array
    # response.each do |hash|
    #   print "# #{hash['codigo']} | #{hash['nome']} \n"
    # end
    @code = gets.chomp.to_i
    list_models
  end

  def ask_price
    puts "vehicle price?"
    # gets.chomp.to_i
  end

  def list_models
    model_url = self.class.get("/carros/marcas/#{@code}/modelos")
    model_url.each do |hash|
      print "# #{hash[1][0]['codigo']} | #{hash[1][0]['nome']} \n"
      # p "#{hash} \n"

      # TEST => Return first element hash
      firts_response = hash[1][0]
      # TEST => Return array element
      second_response = hash[1]
      binding.pry
    end
  end
end
