# frozen_string_literal: true

class Rental
  class Price
    class Duration
      DISCOUNTS = [
        { treshold: 10, rate: 0.5 },
        { treshold: 4, rate: 0.3 },
        { treshold: 1, rate: 0.1 }
      ].freeze

      attr_reader :price_per_day, :duration

      def initialize(price_per_day, duration)
        @price_per_day = price_per_day
        @duration = duration
      end

      def total
        duration * price_per_day - discount
      end

      def discount
        amount = 0
        interim_duration = duration
        DISCOUNTS.each do |discount|
          treshold = discount[:treshold]
          if interim_duration > treshold
            amount += (interim_duration - treshold) * price_per_day * discount[:rate]
            interim_duration = treshold
          end
        end
        amount.to_i
      end
    end
  end
end
