# frozen_string_literal: true

require_relative '../../../helpers/test_helper.rb'

class RentalPaymentsDriverPaymentTest < Minitest::Test
  include TestHelper

  def setup
    @driver_payment = Rental::Payments::DriverPayment.new(rental_default)
  end

  def test_initialized_with_actor
    assert_equal :driver, @driver_payment.actor
  end

  def test_payment_type
    assert_equal :debit, @driver_payment.payment_type
  end

  def test_payment_total
    assert_equal 3_000, @driver_payment.payment_total
  end

  def test_json_output_template
    output = {
      who: :driver,
      type: :debit,
      amount: 3_000
    }
    assert_equal output, @driver_payment.to_json
  end
end
