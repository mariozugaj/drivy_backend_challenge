# frozen_string_literal: true

require 'require_all'

require_all 'lib'

module Fixtures
  def drivy
    @drivy ||= Drivy.new('test/data/input.json')
  end

  def car_default
    @car_default ||= drivy.cars[0]
  end

  def rental_default
    @rental_default ||= Rental.new(drivy.data[:rentals][0])
  end

  def rental_one
    rental_default
  end

  def rental_two
    @rental_two ||= Rental.new(drivy.data[:rentals][1])
  end

  def rental_three
    @rental_three ||= Rental.new(drivy.data[:rentals][2])
  end
end
