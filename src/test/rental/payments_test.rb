# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalPaymentsTest < Minitest::Test
  include TestHelper

  def setup
    @payments = Rental::Payments.new(rental_default)
  end

  def test_payment_for
    driver_payment = Rental::Payments::DriverPayment.new(@rental)
    assert_equal driver_payment.class, @payments.payment_for(:driver).class
  end

  def test_actors
    assert_includes Rental::Payments::ACTORS, :driver
    assert_includes Rental::Payments::ACTORS, :owner
    assert_includes Rental::Payments::ACTORS, :insurance
    assert_includes Rental::Payments::ACTORS, :assistance
    assert_includes Rental::Payments::ACTORS, :drivy
  end

  def test_json_output
    expected_output = [
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

    assert_equal expected_output, @payments.to_json
  end
end
