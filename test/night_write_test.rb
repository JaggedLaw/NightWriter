require 'minitest/autorun'
require 'minitest/pride'
require_relative  '../lib/night_write'
#require "pry";binding.pry

class NightWriteTest < Minitest::Test

# def test_pulls_an_input_file_to_a_string
#    testwriter = NightWrite.new("./message.txt")
#    assert_equal "", testwriter.take_input
# end

def test_take_one_regular_character_and_convert_it_to_first_line_of_its_braille_form
  test_variable = NightWrite.new('a')
  test_variable.convert_to_braille_l1
  assert_equal ['0.'], test_variable.line1
end

def test_take_one_regular_character_and_convert_it_to_its_full_braille_symbol
  test_variable = NightWrite.new('z')
  test_variable.output_lines
  assert_equal ['0.'], test_variable.line1
  assert_equal ['.0'], test_variable.line2
  assert_equal ['00'], test_variable.line3
end

def test_take_one_string_and_convert_it_to_its_full_braille_translation
  test_variable = NightWrite.new('abc xyz')
  test_variable.output_lines
  assert_equal ("0.0.00  00000."), test_variable.line1.join
  assert_equal ("..0...  ...0.0"), test_variable.line2.join
  assert_equal ("......  000000"), test_variable.line3.join
end

def test_take_string_with_capital_letters_and_convert_to_braille_w_capitalization
  test_variable = NightWrite.new('Ca Za Sta')
  test_variable.output_lines
  assert_equal ("..000.  ..0.0.  ...0.00."), test_variable.line1.join
  assert_equal ("......  ...0..  ..0.00.."), test_variable.line2.join
  assert_equal (".0....  .000..  .00.0..."), test_variable.line3.join
end

  #create an output file with braille symbols

  #take a braille character and convert it back to a regular character

  #create an output file with regular characters

end
