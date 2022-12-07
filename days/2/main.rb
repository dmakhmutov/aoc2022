# A X - Rock
# B Y - Paper
# C Z - Scissors

# X - lose
# Y - draw
# Z - win

SCORE_MAPPER = {
  "A X" => 3,
  "A Y" => 6,
  "A Z" => 0,
  "B X" => 0,
  "B Y" => 3,
  "B Z" => 6,
  "C X" => 6,
  "C Y" => 0,
  "C Z" => 3
}.freeze

FIGURE_MAPPER = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3
}.freeze

CORRECT_FIGURE_DETECTOR = {
  "A X" => "Z",
  "A Y" => "X",
  "A Z" => "Y",
  "B X" => "X",
  "B Y" => "Y",
  "B Z" => "Z",
  "C X" => "Y",
  "C Y" => "Z",
  "C Z" => "X"
}.freeze

string = File.read(File.expand_path("#{__dir__}/input.txt"))

answer1 = string
  .split("\n")
  .map { |line| SCORE_MAPPER.fetch(line) + FIGURE_MAPPER.fetch(line.split(" ").last) }.sum

answer2 = string
  .split("\n")
  .map do |line|
    figure = CORRECT_FIGURE_DETECTOR.fetch(line)
    new_line = line.split(" ").first + " " + figure
    SCORE_MAPPER.fetch(new_line) + FIGURE_MAPPER.fetch(figure)
  end.sum

p [answer1, answer2]
