require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_starts_as_empty_array
    expected = {}
    actual = @pantry.stock
    assert_equal expected, actual
  end

  def test_stock_check_method
    expected = 0
    actual = @pantry.stock_check(@cheese)
    assert_equal expected, actual
  end

  def test_restock_method
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    expected = 15
    actual = @pantry.stock_check(@cheese)
    assert_equal expected, actual
  end

  def test_enough_ingredients_method
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    actual = @pantry.enough_ingredients_for?(@mac_and_cheese)
    expected = false
    assert_equal expected, actual
    @pantry.restock(@mac, 8)
    actual_2 = @pantry.enough_ingredients_for?(@mac_and_cheese)
    expected_2 = true
    assert_equal expected_2, actual_2
  end
end
