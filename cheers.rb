begin
  anChars = ["A", "E", "F", "H", "I", "L", "M", "N", "O", "R", "S", "X"]
  isChars = ["S", "X", "Z"]

  puts "What's your name?"

  name = gets.chomp.upcase

  if name.empty?
    raise ArgumentError.new "Names cannot be blank"
  elsif name =~ (/^[[:alpha:]]+$/) and name !~ (/^[[a-zA-Z]]+$/)
    raise ArgumentError.new "Names cannot include accented characters"
  elsif name !~ (/^[[a-zA-Z\-\ ]]+$/)
    raise ArgumentError.new "Names should only include letters, spaces, or hyphens"
  end

  i = 0
  while i < name.length do
    if anChars.include? name[i]
      article = "an"
    else
      article = "a"
    end
    if name[i] == " "
      puts
    else
      puts "Give me #{article}... #{name[i]}"
    end
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
