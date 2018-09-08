# frozen_string_literal: true

class Rental
  class Payments
    ACTORS = %i[driver owner insurance assistance drivy].freeze

    def initialize(rental)
      @rental = rental
    end

    def payment_for(actor)
      Object.const_get("Rental::Payments::#{actor.capitalize}Payment").new(@rental)
    end

    def all_payments
      ACTORS.map { |actor| payment_for(actor) }
    end

    def to_json
      all_payments.map(&:to_json)
    end
  end
end
