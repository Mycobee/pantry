require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_it_exists
    assert_instance_of Ingredient, @cheese
  end

  def test_it_has_name_attribute
    assert_equal "Cheese", @cheese.name
  end

  def test_it_has_unit_attribute
    assert_equal "oz", @cheese.unit
  end

  def test_it_has_calories_attribute
    assert_equal 50, @cheese.calories
  end
end
