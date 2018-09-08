# frozen_string_literal: true

class Rental
  class Payments
    class InsurancePayment < Rental::Payments::Template
      def initialize(rental)
        super(rental)
        @actor = :insurance
      end

      def payment_type
        :credit
      end

      def payment_total
        payment_from_commission
      end
    end
  end
end
