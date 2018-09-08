# frozen_string_literal: true

class Rental
  class Option
    OPTIONS = {
      gps: { price_per_day: 500, payment_to: :owner },
      baby_seat: { price_per_day: 200, payment_to: :owner },
      additional_insurance: { price_per_day: 1000, payment_to: :drivy }
    }.freeze

    attr_reader :id, :rental_id, :type, :price_per_day

    def initialize(args)
      @id = args[:id]
      @rental_id = args[:rental_id]
      @type = args[:type].to_sym
      @price_per_day = OPTIONS[type][:price_per_day]
    end

    def price
      price_per_day * rental_duration
    end

    def payment_to
      OPTIONS[type][:payment_to]
    end

    private

    def rental
      Drivy.new.rentals.find { |rental| rental.id == rental_id }
    end

    def rental_duration
      rental.duration
    end
  end
end
