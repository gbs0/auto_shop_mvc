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

  def ask_name
    puts "vehicle name?"
    gets.chomp
  end

  def ask_price
    puts "vehicle price?"
    gets.chomp.to_i
  end
end
