# frozen_string_literal: true

class Rental
  class Price
    class Distance
      attr_reader :price_per_km, :distance

      def initialize(price_per_km, distance)
        @price_per_km = price_per_km
        @distance = distance
      end

      def total
        price_per_km * distance
      end
    end
  end
end
