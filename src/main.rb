# frozen_string_literal: true

require 'date'
require 'json'
require 'require_all'

require_all 'lib'

FileActions.write(Rentals.new(Drivy.new.rentals).to_json)
