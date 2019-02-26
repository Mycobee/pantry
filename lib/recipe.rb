class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount_required)
    @ingredients_required[ingredient] = amount_required
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total_calories = 0
    calorie_count = @ingredients_required.keys.map do |ingredient|
      ingredient.calories
    end
    
    amount_required_count = @ingredients_required.values.map {|value| value}
    total_array = calorie_count.zip(amount_required_count)
    total_calories = total_array.map {|array| array[0] * array[1]}.sum
    total_calories
  end


end
