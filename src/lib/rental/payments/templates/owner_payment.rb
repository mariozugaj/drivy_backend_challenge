# frozen_string_literal: true

class Rental
  class Payments
    class OwnerPayment < Rental::Payments::Template
      def initialize(rental)
        super(rental)
        @actor = :owner
      end

      def payment_type
        :credit
      end

      def payment_total
        rental.total_price - rental.commission.amount
      end
    end
  end
end
