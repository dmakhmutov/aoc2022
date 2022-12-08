string = File.read(File.expand_path("#{__dir__}/input.txt"))

cargos = {}

def fill_cargos(cargos, string)
  string.split("\n").map do |line|
    next if line.start_with?("move")

    line.chars.each_slice(4).with_index(1) do |col, index|
      cargos[index] ||= []
      new_col = col.map { |item| (item == " ") ? nil : item }.compact.join
      next if new_col.empty? || ("1".."9").cover?(new_col)
      cargos[index] = cargos[index] + [new_col]
    end
  end
end

### Part 1
#
fill_cargos(cargos, string)

string.split("\n").map do |line|
  next unless line.start_with?("move")

  _, move, _, from, _, to = line.split(" ").map { _1.to_i }

  move.times do
    cargos[to] = cargos[from].shift(1) + cargos[to]
  end
end

answer1 = cargos.values.map(&:first).join.delete("[").delete("]")

### Part 2

cargos2 = {}
fill_cargos(cargos2, string)

string.split("\n").map do |line|
  next unless line.start_with?("move")

  _, move, _, from, _, to = line.split(" ").map { _1.to_i }
  cargos2[to] = cargos2[from].shift(move) + cargos2[to]
end

answer2 = cargos2.values.map(&:first).join.delete("[").delete("]")

p [answer1, answer2]
