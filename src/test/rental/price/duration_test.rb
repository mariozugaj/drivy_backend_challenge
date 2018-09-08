# frozen_string_literal: true

require_relative '../../helpers/test_helper.rb'

class RentalPriceDurationTest < Minitest::Test
  include TestHelper

  def setup
    @price_for_duration_no_discount =
      Rental::Price::Duration.new(rental_default.car.price_per_day,
                                  rental_default.duration)
    @price_for_duration_with_discount =
      Rental::Price::Duration.new(rental_three.car.price_per_day,
                                  rental_three.duration)
  end

  def test_parameters
    assert_equal 2_000, @price_for_duration_no_discount.price_per_day
    assert_equal 1, @price_for_duration_no_discount.duration
  end

  def test_total_no_discount
    assert_equal 2_000, @price_for_duration_no_discount.total
  end

  def test_total_with_discount
    assert_equal 17_800, @price_for_duration_with_discount.total
  end

  def test_discount_for_price_no_discount
    assert_equal 0, @price_for_duration_no_discount.discount
  end

  def test_discount_for_price_with_discount
    assert_equal 6_200, @price_for_duration_with_discount.discount
  end
end
