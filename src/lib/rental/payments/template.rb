# frozen_string_literal: true

class Rental
  class Payments
    class Template
      attr_reader :rental, :actor

      def initialize(rental)
        @rental = rental
        @actor = nil
      end

      def payment_type
        raise NotImplementedError
      end

      def payment_total
        raise NotImplementedError
      end

      def to_json
        {
          who: actor,
          type: payment_type,
          amount: payment_total
        }
      end

      private

      def payment_from_commission
        rental.commission.send("#{actor}_fee")
      end
    end
  end
end
