# frozen_string_literal: true

require_relative '../../helpers/test_helper.rb'

class RentalPriceDurationTest < Minitest::Test
  include TestHelper

  def setup
    @price_for_duration =
      Rental::Price::Duration.new(rental_default.car.price_per_day,
                                  rental_default.duration)
  end

  def test_parameters
    assert_equal 2000, @price_for_duration.price_per_day
    assert_equal 1, @price_for_duration.duration
  end

  def test_total
    assert_equal 2000, @price_for_duration.total
  end
end
