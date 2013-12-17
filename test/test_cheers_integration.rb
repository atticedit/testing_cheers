require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

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

  def test_a_name_with_only_characters_that_take_a_before_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("duck")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a... D", "Give me a... U", "Give me a... C", "Give me a... K"
  end

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

end
