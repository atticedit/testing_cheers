anChars = ["A", "E", "F", "H", "I", "L", "M", "N", "O", "R", "S", "X"]

puts "What's your name?"
name = gets.chomp
name = name.upcase
count = name.length

i = 0
while i < count do
  if anChars.include? name[i]
    article = "an"
  else
    article = "a"
  end
  puts "Give me #{article}... #{name[i]}"
  i = i + 1
end

if name[-1] == "S"
  verb = " is"
else
  verb = "\'s"
end
  puts "#{name}#{verb} just GRAND!"