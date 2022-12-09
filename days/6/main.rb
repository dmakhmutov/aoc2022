input = File.read(File.expand_path("#{__dir__}/input.txt")).chomp

## Part 1
answer1 = input.chars.each_with_index do |_char, index|
  next unless index > 2
  break index + 1 if input[index - 3..index].chars.uniq.size == 4
end

## Part 2
answer2 = input.chars.each_with_index do |_char, index|
  next unless index > 12
  break index + 1 if input[index - 13..index].chars.uniq.size == 14
end

p [answer1, answer2]
