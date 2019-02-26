require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'
require './lib/cookbook'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_recipes_attribute_starts_with_empty_array
    assert_equal [], @cookbook.recipes
  end

  def test_cookbook_can_add_recipes
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    assert_equal [@mac_and_cheese, @burger], @cookbook.recipes
  end

  def test_it_can_summarize_based_on_total_calories_count
    @cookbook.add_recipe(@burger)
    @cookbook.add_recipe(@mac_and_cheese)
    assert_equal [@mac_and_cheese, @burger], @cookbook.summary
  end
end
