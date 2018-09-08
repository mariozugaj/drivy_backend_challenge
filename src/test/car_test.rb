# frozen_string_literal: true

require_relative './helpers/test_helper.rb'

class CarTest < Minitest::Test
  include TestHelper

  def setup
    @car = car_default
  end

  def test_initialize_with_arguments
    assert @car
    assert_equal 1, @car.id
    assert_equal 2000, @car.price_per_day
    assert_equal 10, @car.price_per_km
  end
end
