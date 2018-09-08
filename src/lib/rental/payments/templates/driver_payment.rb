# frozen_string_literal: true

class Rental
  class Payments
    class DriverPayment < Rental::Payments::Template
      def initialize(rental)
        super(rental)
        @actor = :driver
      end

      def payment_type
        :debit
      end

      def payment_total
        rental.total_price
      end
    end
  end
end
