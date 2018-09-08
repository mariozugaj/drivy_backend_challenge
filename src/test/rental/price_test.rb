# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalPriceTest < Minitest::Test
  include TestHelper

  def setup
    @price_no_discount = Rental::Price.new(rental_default)
    @price_with_discount = Rental::Price.new(rental_three)
  end

  def test_total
    assert_equal 3_000, @price_no_discount.total
    assert_equal 27_800, @price_with_discount.total
  end

  def test_all_components
    expected_result = [@price_no_discount.for_duration, @price_no_discount.for_distance]
    assert_equal expected_result, @price_no_discount.all_components
  end
end
