# frozen_string_literal: true

class Rental
  class Price
    attr_reader :rental

    def initialize(rental)
      @rental = rental
    end

    def for_duration
      @for_duration ||= Rental::Price::Duration.new(rental.car.price_per_day,
                                                    rental.duration)
    end

    def for_distance
      @for_distance ||= Rental::Price::Distance.new(rental.car.price_per_km,
                                                    rental.metadata.distance)
    end

    def total
      all_components.map(&:total).reduce(:+)
    end

    def all_components
      [for_duration, for_distance]
    end
  end
end
