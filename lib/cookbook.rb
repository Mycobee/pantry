class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    @recipes.sort_by do |recipe|
      recipe.total_calories
    end
  end
end
