string = File.read(File.expand_path("#{__dir__}/input.txt"))

SCORE_MAPPER = ("a".."z").to_a + ("A".."Z").to_a.freeze

### Part 1
def halves(str)
  [str[0, str.size / 2].chars, str[str.size / 2..].chars]
end

items = string.split("\n").map do |line|
  first, second = halves(line)
  first.intersection(second)
end.flatten

answer1 = items.sum { |item| SCORE_MAPPER.index(item) + 1 }

### Part 2

items = string.split("\n").each_slice(3).map do |first, second, third|
  first, second, third = [first, second, third].map { |line| line.chars }
  first.intersection(second).intersection(third)
end.flatten

answer2 = items.sum { |item| SCORE_MAPPER.index(item) + 1 }

p [answer1, answer2]
