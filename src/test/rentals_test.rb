# frozen_string_literal: true

require_relative './helpers/test_helper.rb'

class RentalsTest < Minitest::Test
  include TestHelper

  def setup
    @rentals = Rentals.new(drivy.rentals)
  end

  def test_json_output
    assert_equal FileActions.read(expected_output_file), @rentals.to_json
  end
end
