class SessionsView

  attr_reader :username
  def display(employees)
    # puts "------------------"
    # puts "Avaliable Meals"
    # puts "------------------"
    # puts "------------------"
  end


  def ask_username
    puts "Whats your user name?"
    username = gets.chomp
    # self
  end
  
  def ask_passoword
      puts "Meal price?"
      gets.chomp
  end   
  
  def wrong_credentials
    puts "Wrong Credentials... try again"
  end

  def welcome(employee)
    puts "Welcome #{employee.username}"
  end

end





