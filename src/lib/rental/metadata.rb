# frozen_string_literal: true

class Rental
  class Metadata
    attr_reader :start_date, :end_date, :distance

    def initialize(args)
      @start_date = Date.parse(args[:start_date])
      @end_date = Date.parse(args[:end_date])
      @distance = args[:distance]
    end
  end
end
