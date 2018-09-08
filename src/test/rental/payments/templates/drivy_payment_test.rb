# frozen_string_literal: true

require_relative '../../../helpers/test_helper.rb'

class RentalPaymentsDrivyPaymentTest < Minitest::Test
  include TestHelper

  def setup
    @drivy_payment = Rental::Payments::DrivyPayment.new(rental_default)
  end

  def test_initialized_with_actor
    assert_equal :drivy, @drivy_payment.actor
  end

  def test_payment_type
    assert_equal :credit, @drivy_payment.payment_type
  end

  def test_payment_total
    assert_equal 350, @drivy_payment.payment_total
  end

  def test_json_output_template
    output = {
      who: :drivy,
      type: :credit,
      amount: 350
    }
    assert_equal output, @drivy_payment.to_json
  end
end
