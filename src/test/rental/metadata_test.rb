# frozen_string_literal: true

require_relative '../helpers/test_helper.rb'

class RentalMetadataTest < Minitest::Test
  include TestHelper

  def setup
    @metadata = Rental::Metadata.new(drivy.data[:rentals][0])
  end

  def test_parameters
    date = Date.parse('2015-12-8')
    assert_equal date, @metadata.start_date
    assert_equal date, @metadata.end_date
    assert_equal 100, @metadata.distance
  end
end
