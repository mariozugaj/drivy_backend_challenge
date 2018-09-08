# frozen_string_literal: true

class Drivy
  attr_reader :input_file

  def initialize(input_file = FileActions::INPUT_FILE)
    @input_file = input_file
  end

  def data
    JSON.parse(FileActions.read(input_file), symbolize_names: true)
  end

  def cars
    data[:cars].map { |car| Car.new(car) }
  end

  def rentals
    data[:rentals].map { |rental| Rental.new(rental) }
  end

  def options
    data[:options].map { |option| Rental::Option.new(option) }
  end
end
