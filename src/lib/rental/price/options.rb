# frozen_string_literal: true

class Rental
  class Price
    class Options
      attr_reader :options, :duration

      def initialize(options, duration)
        @options = options
        @duration = duration
      end

      def total
        if options.empty?
          0
        else
          options.map(&:price).reduce(:+)
        end
      end
    end
  end
end
