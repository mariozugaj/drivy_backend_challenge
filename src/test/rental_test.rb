# frozen_string_literal: true

require_relative './helpers/test_helper.rb'

class RentalTest < Minitest::Test
  include TestHelper

  def setup
    @rental_one = rental_one
    @rental_two = rental_two
    @rental_three = rental_three
  end

  def test_parameters
    assert_equal 1, @rental_one.id
  end

  def test_duration
    assert_equal 1, @rental_one.duration
    assert_equal 2, @rental_two.duration
    assert_equal 12, @rental_three.duration
  end

  def test_total_price
    assert_equal 3_700, @rental_one.total_price
    assert_equal 8_800, @rental_two.total_price
    assert_equal 27_800, @rental_three.total_price
  end

  def test_commission_price
    assert_equal 3_000, @rental_one.commission_price
    assert_equal 6_800, @rental_two.commission_price
    assert_equal 27_800, @rental_three.commission_price
  end

  def test_options
    assert_equal %i[gps baby_seat], @rental_one.options.map(&:type)
  end

  def test_json_output
    expected_output = {
      "id": 1,
      "options": [
        :gps,
        :baby_seat
      ],
      "actions": [
        {
          "who": :driver,
          "type": :debit,
          "amount": 3700
        },
        {
          "who": :owner,
          "type": :credit,
          "amount": 2800
        },
        {
          "who": :insurance,
          "type": :credit,
          "amount": 450
        },
        {
          "who": :assistance,
          "type": :credit,
          "amount": 100
        },
        {
          "who": :drivy,
          "type": :credit,
          "amount": 350
        }
      ]
    }

    assert_equal expected_output, @rental_one.to_json
  end
end
