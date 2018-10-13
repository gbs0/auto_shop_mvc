class VehiclesView
  def ask_name
    puts "Enter meal name:"
    gets.chomp
  end

  def ask_price
    puts "Enter price:"
    gets.chomp.to_i
  end

  def list(vehicles)
    vehicles.each do |vehicle|
      puts "##{vehicle.id} | #{vehicle.brand} | #{vehicle.model} | R$ #{vehicle.price}"
    end
  end

end