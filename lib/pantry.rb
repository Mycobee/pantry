class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    if @stock[item] == nil
      return 0
    else
      @stock[item]
    end
  end

  def restock(item, quantity)
    if
      @stock[item] == nil
      @stock[item] = quantity
    else
      @stock[item] += quantity
    end
  end

  def enough_ingredients_for?(recipe)
      amounts_required = recipe.ingredients_required.values
      stock = recipe.ingredients.map do |ingredient|
                stock_check(ingredient)
              end
     comparisons = amounts_required.zip(stock)
     result = comparisons.any? do |comparison|
       comparison[1] < comparison[0]
     end

     if result == true
       return false
     else
       true
     end
  end


end
