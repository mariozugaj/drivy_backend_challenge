# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalOptionTest < Minitest::Test
  include TestHelper

  def setup
    @drivy_options = drivy.data[:options]
    @option_one_day_rental = Rental::Option.new(@drivy_options[0])
    @option_two_day_rental = Rental::Option.new(@drivy_options[2])
  end

  def test_price
    assert_equal 500, @option_one_day_rental.price
    assert_equal 2_000, @option_two_day_rental.price
  end

  def test_payment_to
    assert_equal :owner, @option_one_day_rental.payment_to
    assert_equal :drivy, @option_two_day_rental.payment_to
  end
end
