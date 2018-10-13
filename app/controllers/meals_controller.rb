require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    # should be initialized with a `MealRepository` instance
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
    # should grab meals from the repo and display them
  end

  def add
    name = @view.ask_name
    price = @view.ask_price
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.add(new_meal)
    # should ask the user for a name and price, then store the new meal
  end
end
