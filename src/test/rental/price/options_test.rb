# frozen_string_literal: true

require_relative '../../helpers/test_helper.rb'

class RentalPriceOptionsTest < Minitest::Test
  include TestHelper

  def setup
    @price_rental_with_options =
      Rental::Price::Options.new(rental_default.options,
                                 rental_default.duration)
    @price_rental_no_options =
      Rental::Price::Options.new(rental_three.options,
                                 rental_three.duration)
  end

  def test_parameters
    assert_equal 1, @price_rental_with_options.duration
  end

  def test_total_for_rental_with_options
    assert_equal 700, @price_rental_with_options.total
  end

  def test_total_for_rental_no_options
    assert_equal 0, @price_rental_no_options.total
  end
end
