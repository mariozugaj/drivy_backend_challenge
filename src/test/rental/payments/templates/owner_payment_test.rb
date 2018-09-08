# frozen_string_literal: true

require_relative '../../../helpers/test_helper.rb'

class RentalPaymentsOwnerPaymentTest < Minitest::Test
  include TestHelper

  def setup
    @owner_payment = Rental::Payments::OwnerPayment.new(rental_default)
  end

  def test_initialized_with_actor
    assert_equal :owner, @owner_payment.actor
  end

  def test_payment_type
    assert_equal :credit, @owner_payment.payment_type
  end

  def test_payment_total
    assert_equal 2_800, @owner_payment.payment_total
  end

  def test_json_output_template
    output = {
      who: :owner,
      type: :credit,
      amount: 2_800
    }
    assert_equal output, @owner_payment.to_json
  end
end
