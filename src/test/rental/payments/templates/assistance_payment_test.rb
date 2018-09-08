# frozen_string_literal: true

require_relative '../../../helpers/test_helper.rb'

class RentalPaymentsAssistancePaymentTest < Minitest::Test
  include TestHelper

  def setup
    @assistance_payment = Rental::Payments::AssistancePayment.new(rental_default)
  end

  def test_initialized_with_actor
    assert_equal :assistance, @assistance_payment.actor
  end

  def test_payment_type
    assert_equal :credit, @assistance_payment.payment_type
  end

  def test_payment_total
    assert_equal 100, @assistance_payment.payment_total
  end

  def test_json_output_template
    output = {
      who: :assistance,
      type: :credit,
      amount: 100
    }
    assert_equal output, @assistance_payment.to_json
  end
end
