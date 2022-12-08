string = File.read(File.expand_path("#{__dir__}/input.txt"))

### Part 1
answer1 = string.split("\n").map { _1.split(",") }.map do |(x, y)|
  first_elf = (x.split("-")[0].to_i..x.split("-")[1].to_i).to_a
  second_elf = (y.split("-")[0].to_i..y.split("-")[1].to_i).to_a

  if first_elf.size > second_elf.size
    second_elf.all? { |num| first_elf.include?(num) }
  else
    first_elf.all? { |num| second_elf.include?(num) }
  end
end.select { _1 }.size

### Part 2
answer2 = string.split("\n").map { _1.split(",") }.map do |(x, y)|
  first_elf = (x.split("-")[0].to_i..x.split("-")[1].to_i).to_a
  second_elf = (y.split("-")[0].to_i..y.split("-")[1].to_i).to_a

  if first_elf.size > second_elf.size
    second_elf.any? { |num| first_elf.include?(num) }
  else
    first_elf.any? { |num| second_elf.include?(num) }
  end
end.select { _1 }.size

p [answer1, answer2]
