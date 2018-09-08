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

  def commission
    @commission ||= Rental::Commission.new(total_price, duration)
  end

  def to_json
    {
      id: id,
      price: total_price,
      commission: commission.to_json
    }
  end
end
