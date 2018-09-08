# frozen_string_literal: true

require_relative '../../../helpers/test_helper.rb'

class RentalPaymentsInsurancePaymentTest < Minitest::Test
  include TestHelper

  def setup
    @insurance_payment = Rental::Payments::InsurancePayment.new(rental_default)
  end

  def test_initialized_with_actor
    assert_equal :insurance, @insurance_payment.actor
  end

  def test_payment_type
    assert_equal :credit, @insurance_payment.payment_type
  end

  def test_payment_total
    assert_equal 450, @insurance_payment.payment_total
  end

  def test_json_output_template
    output = {
      who: :insurance,
      type: :credit,
      amount: 450
    }
    assert_equal output, @insurance_payment.to_json
  end
end
