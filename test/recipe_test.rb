require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/recipe'
require './lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_name_attribute
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_ingredients_require_starts_with_empty_hash
    actual = @mac_and_cheese.ingredients_required
    expected = {}
    assert_equal expected, actual
  end

  def test_add_ingredient_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    actual = @mac_and_cheese.ingredients_required
    expected = {@cheese => 2, @mac => 8}
    assert_equal actual, expected
  end

  def test_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    actual = @mac_and_cheese.amount_required(@cheese)
    expected = 2
    assert_equal expected, actual
    actual_2 = @mac_and_cheese.amount_required(@mac)
    expected_2 = 8
    assert_equal actual_2, expected_2
  end

  def test_ingredients_attribute
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = [@cheese, @mac]
    actual = @mac_and_cheese.ingredients
    assert_equal expected, actual
  end

  def test_total_calories_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = 440
    actual = @mac_and_cheese.total_calories
    assert_equal expected, actual
  end
end
