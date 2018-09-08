# frozen_string_literal: true

class Rentals
  attr_reader :rentals

  def initialize(rentals)
    @rentals = rentals
  end

  def to_json
    JSON.pretty_generate(rentals: rentals.map(&:to_json))
  end
end
