# frozen_string_literal: true

class Rental
  attr_reader :id, :metadata, :drivy, :car

  def initialize(args)
    @id = args[:id]
    @drivy = Drivy.new
    @car = drivy.cars.find { |car| car.id == args[:car_id] }
    @metadata = Rental::Metadata.new(args)
  end

  def duration
    (metadata.end_date - metadata.start_date).to_i + 1
  end

  def price
    @price ||= Rental::Price.new(self)
  end

  def total_price
    price.total
  end

  def commission_price
    price.commisionable_total
  end

  def commission
    @commission ||= Rental::Commission.new(commission_price, duration)
  end

  def payments
    @payments ||= Rental::Payments.new(self)
  end

  def options
    @options ||= drivy.options.select do |option|
      option.rental_id == id
    end
  end

  def to_json
    {
      id: id,
      options: options.map(&:type),
      actions: payments.to_json
    }
  end
end
