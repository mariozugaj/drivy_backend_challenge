# frozen_string_literal: true

class Rental
  class Commission
    COMMISSION_PERCENTAGE = 0.3
    INSURANCE_SHARE = 0.5
    ASSISTANCE_COST_PER_DAY = 100

    attr_reader :price, :duration

    def initialize(price, duration)
      @price = price
      @duration = duration
    end

    def amount
      (price * COMMISSION_PERCENTAGE).to_i
    end

    def insurance_fee
      (amount * INSURANCE_SHARE).to_i
    end

    def assistance_fee
      duration * ASSISTANCE_COST_PER_DAY
    end

    def drivy_fee
      amount - insurance_fee - assistance_fee
    end

    def to_json
      {
        insurance_fee: insurance_fee,
        assistance_fee: assistance_fee,
        drivy_fee: drivy_fee
      }
    end

    private

    def respond_to_missing?(method_name)
      method_name.match?(/_fee/)
    end

    def method_missing(method_name)
      if method_name.match?(/_fee/)
        0
      else
        super
      end
    end
  end
end
