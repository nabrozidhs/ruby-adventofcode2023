# frozen_string_literal: true

module Day18
  def self.find_area(input)
    perimeter = 0
    current = [0, 0]
    path = []
    input.each do |line|
      d, n, = line.split
      direction = case d
                  when 'U'
                    [0, -1]
                  when 'D'
                    [0, 1]
                  when 'L'
                    [-1, 0]
                  when 'R'
                    [1, 0]
                  else
                    throw Exception
                  end
      number = n.to_i

      path << current
      current = [current[0] + (direction[0] * number), current[1] + (direction[1] * number)]
      perimeter += number
    end

    area = (0..path.length - 1).sum do |i|
      (path[i][0] * path[(i + 1) % path.length][1]) - (path[(i + 1) % path.length][0] * path[i][1])
    end
    area /= 2

    interior_area = area - (perimeter / 2) + 1
    interior_area + perimeter
  end

  def self.part1(input)
    find_area input.split("\n")
  end

  def self.part2(input)
    direction = 'RDLU'
    new_input = input.split("\n").map do |line|
      hex = line.split[-1][2..-2]
      "#{direction[hex[-1].to_i]} #{hex[0..-2].to_i(16)}"
    end
    find_area new_input
  end
end
