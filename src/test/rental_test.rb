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
    assert_equal 3_000, @rental_one.total_price
    assert_equal 7_000, @rental_two.total_price
    assert_equal 34_000, @rental_three.total_price
  end

  def test_json_output
    expected_output = {
      "id": 1,
      "price": 3000
    }

    assert_equal expected_output, @rental_one.to_json
  end
end
