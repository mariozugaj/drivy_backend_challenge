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
        rental.commission_price - rental.commission.amount + payment_from_options
      end
    end
  end
end
