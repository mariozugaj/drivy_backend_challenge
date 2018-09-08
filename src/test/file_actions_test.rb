# frozen_string_literal: true

require_relative './helpers/test_helper.rb'

class FileActionsTest < Minitest::Test
  include TestHelper

  def setup
    @input_file = 'test/data/input.txt'
    @output_file = 'test/data/output.txt'
    @sentence = "These pretzels are making me thirsty!\n"
  end

  def teardown
    File.truncate(@output_file, 0)
  end

  def test_reading_from_default_file
    assert_equal FileActions.read, File.read(FileActions::INPUT_FILE)
  end

  def test_reading_from_given_file
    assert_equal FileActions.read(@input_file), File.read(@input_file)
  end

  def test_writing_to_given_file
    FileActions.write(@sentence, @output_file)
    assert_equal @sentence, FileActions.read(@output_file)
  end
end
