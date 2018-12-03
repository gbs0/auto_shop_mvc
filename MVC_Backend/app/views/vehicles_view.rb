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
    puts "Select Vehicle Brand"
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
    code = gets.chomp.to_i
    list_models(code)
  end

  def ask_price
    puts "vehicle price?"
    # gets.chomp.to_i
  end

  def list_models(code)
    # // GET METHOD FOR 'MODELOS URL'
    model_url = self.class.get("/carros/marcas/#{code}/modelos")
    model_url.each do |hash|
      # Print models and code
      print "# #{hash[1]['codigo']} | #{hash[1]['nome']} | \n"
      # Pruint first model name and code
      # print "# #{hash[1][0]['codigo']} | #{hash[1][0]['nome']} | \n"

      # TEST => Return first element hash
      response_one = hash[1][0]
      # TEST => Return array element
      response_two = hash[1]
      binding.pry
    end
  end
end
