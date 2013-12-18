require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

    # - - - - - - - characters that take 'a' before - - - - - - - #

  def test_a_name_with_only_characters_that_take_a_before_in_correct_order
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("duck")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a... D", "Give me a... U", "Give me a... C", "Give me a... K"
  end

  def test_a_name_with_only_characters_that_take_a_before
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("duck")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... D
Give me a... U
Give me a... C
Give me a... K
DUCK's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

    # - - - - - - - characters that take 'an' before - - - - - - - #

  def test_a_name_with_only_characters_that_take_an_before
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("flea")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... F
Give me an... L
Give me an... E
Give me an... A
FLEA's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

    # - - - - - - - characters that take both 'a' and 'an' before - - - - - - - #

  def test_a_name_with_characters_that_take_both_a_and_an
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("bob")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me an... O
Give me a... B
BOB's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

    # - - - - - - - ending characters - - - - - - - #

  def test_a_name_ending_in_s
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("hans")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, "HANS is just GRAND!"
  end

  def test_a_name_ending_in_z
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("franz")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, "FRANZ is just GRAND!"
  end

  def test_a_name_ending_in_x
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("felix")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, "FELIX is just GRAND!"
  end

    # - - - - - - - variable case character entry - - - - - - - #

  def test_a_name_entered_as_uppercase_characters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("BOB")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me an... O
Give me a... B
BOB's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_entered_as_variable_case_characters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("fELIx")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... F
Give me an... E
Give me an... L
Give me an... I
Give me an... X
FELIX is just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

    # - - - - - - - nonstandard characters - - - - - - - #

  def test_a_name_with_a_zero
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("B0B")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Names shouldn't include any numerals
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_a_space
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("anna mae")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... N
Give me an... N
Give me an... A

Give me an... M
Give me an... A
Give me an... E
ANNA MAE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_a_hyphen
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("jean-luc")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... J
Give me an... E
Give me an... A
Give me an... N
Give me a... -
Give me an... L
Give me a... U
Give me a... C
JEAN-LUC's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

end
