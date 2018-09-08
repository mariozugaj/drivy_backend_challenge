# frozen_string_literal: true

class Rental
  class Price
    class Duration
      attr_reader :price_per_day, :duration

      def initialize(price_per_day, duration)
        @price_per_day = price_per_day
        @duration = duration
      end

      def total
        duration * price_per_day
      end
    end
  end
end
