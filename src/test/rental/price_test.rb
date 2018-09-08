# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalPriceTest < Minitest::Test
  include TestHelper

  def setup
    @price = Rental::Price.new(rental_default)
  end

  def test_total
    assert_equal 3000, @price.total
  end

  def test_all_components
    expected_result = [@price.for_duration, @price.for_distance]
    assert_equal expected_result, @price.all_components
  end
end
