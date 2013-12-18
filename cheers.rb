begin
  anChars = ["A", "E", "F", "H", "I", "L", "M", "N", "O", "R", "S", "X"]
  isChars = ["S", "X", "Z"]

  puts "What's your name?"

  name = gets.chomp.upcase

  raise ArgumentError.new "Names shouldn't include any numerals" if name.include? "0"

  i = 0
  while i < name.length do
    if anChars.include? name[i]
      article = "an"
    else
      article = "a"
    end
    puts "Give me #{article}... #{name[i]}"
    i += 1
  end

  if isChars.include? name[-1]
    verb = " is"
  else
    verb = "\'s"
  end
    puts "#{name}#{verb} just GRAND!"
rescue Exception => msg
  puts msg
end