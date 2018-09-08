# frozen_string_literal: true

require 'date'
require 'json'
require 'minitest/autorun'
require 'require_all'

require_all 'lib'
require_relative './fixtures.rb'

module TestHelper
  include Fixtures

  def input_file
    'test/data/input.json'
  end

  def expected_output_file
    'test/data/expected_output.json'
  end
end
