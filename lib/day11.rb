# frozen_string_literal: true

module Day11
  def self.base(input, expand_number)
    lines = input.split("\n")
    galaxies = []
    empty_rows = []

    lines.each_with_index do |line, y|
      empty_row = true
      line.chars.each_with_index do |c, x|
        if c == '#'
          galaxies << [x, y]
          empty_row = false
        end
      end
      empty_rows << y if empty_row
    end

    empty_columns = (0..lines[0].length - 1).filter do |x|
      (0..lines.length - 1).all? { |y| lines[y][x] == '.' }
    end

    (0..galaxies.length - 1).each do |index|
      galaxy_position = galaxies[index]
      galaxies[index] = [galaxy_position[0] + (expand_number * empty_columns.count { |i| i < galaxy_position[0] }),
                         galaxy_position[1] + (expand_number * empty_rows.count { |i| i < galaxy_position[1] })]
    end

    result = (0..galaxies.length - 2).map do |i|
      result = (i + 1..galaxies.length - 1).map do |j|
        (galaxies[i][0] - galaxies[j][0]).abs + (galaxies[i][1] - galaxies[j][1]).abs
      end
      result.sum
    end
    result.sum
  end

  def self.part1(input)
    base(input, 1)
  end

  def self.part2(input, expand_number = 1_000_000)
    base(input, expand_number - 1)
  end
end
