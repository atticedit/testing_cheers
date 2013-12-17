anChars = ["A", "E", "F", "H", "I", "L", "M", "N", "O", "R", "S", "X"]
isChars = ["S", "Z"]

puts "What's your name?"
name = gets.chomp.upcase
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

if isChars.include? name[-1]
  verb = " is"
else
  verb = "\'s"
end
  puts "#{name}#{verb} just GRAND!"