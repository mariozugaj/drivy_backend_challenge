# frozen_string_literal: true

class FileActions
  INPUT_FILE = '../levels/level5/data/input.json'
  OUTPUT_FILE = 'data/output.json'

  class << self
    def read(input = INPUT_FILE)
      File.read(input)
    end

    def write(content, output_file = OUTPUT_FILE)
      File.open(output_file, 'w') { |file| file.puts content }
    end
  end
end
