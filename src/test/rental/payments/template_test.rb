# frozen_string_literal: true

require_relative '../../helpers/test_helper.rb'

class RentalPaymentsTemplateTest < Minitest::Test
  include TestHelper

  def setup
    @template = Rental::Payments::Template.new(rental_default)
  end

  def test_initialized_with_no_actor
    assert_nil @template.actor
  end

  def test_payment_type
    assert_raises(NotImplementedError) { @template.payment_type }
  end

  def test_payment_total
    assert_raises(NotImplementedError) { @template.payment_total }
  end

  def test_json_output_template
    assert_raises(NotImplementedError) { @template.to_json }
  end
end
