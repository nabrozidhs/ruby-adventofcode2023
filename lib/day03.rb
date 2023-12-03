# frozen_string_literal: true

module Day03
  def self.part1(input)
    lines = input.split("\n")

    sum = 0
    lines.each_with_index.each do |line, y_index|
      matches = line.scan(/\d+/)
      offset = 0
      matches.each do |match|
        x_index = line.index(match, offset)
        offset = x_index + match.length

        no_symbols = ((y_index - 1)..(y_index + 1)).all? do |y|
          ((x_index - 1)..(x_index + match.length)).all? do |x|
            y.negative? || y >= lines.length ||
              x.negative? || x >= line.length ||
              (y == y_index && x >= x_index && x < x_index + match.length) ||
              lines[y][x] == '.'
          end
        end

        sum += match.to_i unless no_symbols
      end
    end

    sum
  end

  def self.part2(input)
    lines = input.split("\n")

    gears = {}
    lines.each_with_index.each do |line, y_index|
      matches = line.scan(/\d+/)
      offset = 0
      matches.each do |match|
        x_index = line.index(match, offset)
        offset = x_index + match.length

        search_space = ((y_index - 1)..(y_index + 1)).flat_map do |y|
          ((x_index - 1)..(x_index + match.length)).map { |x| [x, y] }
        end

        search_space.each do |x, y|
          if (0..lines.length - 1).member?(y) && (0..lines.first.length - 1).member?(x) && lines[y][x] == '*'
            gears[[x, y]] = gears.fetch([x, y], []) + [match]
            break
          end
        end
      end
    end

    gears.values
         .filter { |e| e.length == 2 }
         .map { |a, b| a.to_i * b.to_i }
         .sum
  end
end
