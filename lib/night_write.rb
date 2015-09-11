
class NightWrite

  attr_accessor :string, :original_string, :line1, :line2, :line3, :capital_index

  def initialize(string)
    # require "pry";binding.pry
    @original_string = string.chars
    @string = string.downcase.chars
    @string_length = string.length
    @line1 = []
    @line2 = []
    @line3 = []
    @capital_index = []
  end

  def convert_to_braille_l1
    i = 1
    #require "pry";binding.pry
    string
    string.each {|x|
      if x ==('a')||x ==('b')||x ==('e')||x ==('h')||x ==('k')||x ==('l')||
         x ==('o')||x ==('r')||x ==('u')||x ==('v')||x ==('z')
        line1 << "0."
      elsif x ==('c')||x ==('d')||x ==('f')||x ==('g')||x ==('m')||x ==('n')||
            x ==('p')||x ==('q')||x ==('x')||x ==('y')
        line1 << "00"
      elsif x ==('i')||x ==('j')||x ==('s')||x ==('t')||x ==('w')
        line1 << ".0"
      elsif x ==(' ')
        line1 << "  "
      else
        line1 << "#{x}#{x}"
      end
      i += 1
    }

  end

  def convert_to_braille_l2
    i = 1
    string.each {|x|
      if x ==('b')||x ==('f')||x ==('i')||x ==('l')||x ==('p')||x ==('s')||
         x ==('v')
        line2 << "0."
      elsif x ==('g')||x ==('h')||x ==('j')||x ==('q')||x ==('r')||x ==('t')||
              x ==('w')
        line2 << "00"
      elsif x ==('d')||x ==('e')||x ==('n')||x ==('o')||x ==('y')||x ==('z')
        line2 << ".0"
      elsif x ==('a')||x ==('c')||x ==('k')||x ==('m')||x ==('u')||x ==('x')
        line2 << ".."
      elsif x ==(' ')
        line2 << "  "
      else
        line2 << "#{x}#{x}"
      end
      i += 1
    }
  end

  def convert_to_braille_l3
    i = 1
    string.each {|x|
      if x ==('k')||x ==('l')||x ==('m')||x ==('n')||x ==('o')||x ==('p')||
         x ==('q')||x ==('r')||x ==('s')||x ==('t')
        line3 << "0."
      elsif x ==('u')||x ==('v')||x ==('x')||x ==('y')||x ==('z')
        line3 << "00"
      elsif x ==('d')||x ==('e')||x ==('n')||x ==('o')||x ==('y')||x ==('z')||x ==('w')
        line3 << ".0"
      elsif x ==('a')||x ==('b')||x ==('c')||x ==('d')||x ==('e')||x ==('f')||x ==('g')||x ==('h')||x ==('i')||x ==('j')
        line3 << ".."
      elsif x ==(' ')
        line3 << "  "
      else
        line3 << "#{x}#{x}"
      end
      i += 1
    }
  end

  def check_for_capitalization
    index_num = 0
    original_string.each {|x|
      if x ==('A')||x==('B')||x==('C')||x==('D')||x==('E')||x==('F')||x==('G')||x==('H')||x==('I')||
        x==('J')||x==('K')||x==('L')||x==('M')||x==('N')||x==('O')||x==('P')||x==('Q')||x==('R')||
        x==('S')||x==('T')||x==('U')||x==('V')||x==('W')||x==('X')||x==('Y')||x==('Z')
        capital_index << index_num
      end
      index_num += 1
    }
  end

  def add_capitalization_character
    check_for_capitalization
    i = 0
    cap_i = 0
    repetitions = original_string.length
    while i <= repetitions
      if i == capital_index[cap_i]
        #shovel capital braille character into string
        @line1 = line1.insert(i, "..")
        @line2 = line2.insert(i, "..")
        @line3 = line3.insert(i, ".0")
        capital_index[cap_i]
        cap_i += 1
        if cap_i == capital_index.length
          break
        end
        @capital_index = capital_index.map { |e| e + 1 }
        repetitions += 1
      end
      i += 1
    end
  end

  def output_lines
    convert_to_braille_l1
    convert_to_braille_l2
    convert_to_braille_l3
    add_capitalization_character
    return line1.join + "\n" + line2.join + "\n" + line3.join
  end


end
#DO NOT DELETE! uncomment when you need to use message.txt file
# input_file_string = File.open(ARGV[0]).read
# input_string = input_file_string.chomp

# test_string = NightWrite.new(input_string)
# braille_output = test_string.output_lines

# File.open(ARGV[1], 'w') {|f| f.write(braille_output)}
