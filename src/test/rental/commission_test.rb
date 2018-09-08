# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalCommissionTest < Minitest::Test
  include TestHelper

  def setup
    @commission = Rental::Commission.new(rental_default.commission_price,
                                         rental_default.duration)
  end

  def test_parameters
    assert_equal 3_000, @commission.price
    assert_equal 1, @commission.duration
  end

  def test_commission_amount
    assert_equal 900, @commission.amount
  end

  def test_insurance_fee
    assert_equal 450, @commission.insurance_fee
  end

  def test_assistance_fee
    assert_equal 100, @commission.assistance_fee
  end

  def test_drivy_fee
    assert_equal 350, @commission.drivy_fee
  end

  def test_wrong_fee
    assert_equal 0, @commission.owner_fee
  end

  def test_json_output
    expected_output = {
      "insurance_fee": 450,
      "assistance_fee": 100,
      "drivy_fee": 350
    }
    assert_equal expected_output, @commission.to_json
  end
end
