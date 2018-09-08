# frozen_string_literal: true

require_relative '../../helpers/test_helper.rb'

class RentalPriceDistanceTest < Minitest::Test
  include TestHelper

  def setup
    @price_for_distance =
      Rental::Price::Distance.new(rental_default.car.price_per_km,
                                  rental_default.metadata.distance)
  end

  def test_parameters
    assert_equal 10, @price_for_distance.price_per_km
    assert_equal 100, @price_for_distance.distance
  end

  def test_total
    assert_equal 1_000, @price_for_distance.total
  end
end
