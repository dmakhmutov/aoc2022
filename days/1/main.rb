calories = File.read(File.expand_path("input.txt"))
top_three_calories = calories
  .split("\n\n")
  .map { |elf_calories| elf_calories.split("\n").sum(&:to_i) }.sort.last(3).reverse

p [top_three_calories.first, top_three_calories.sum]
