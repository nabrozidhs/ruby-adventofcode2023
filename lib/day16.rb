# frozen_string_literal: true

module Day16
  def self.travel(max_x, max_y, position, direction, mirrors, skip, visited)
    return unless (0..max_x - 1).include? position[0]
    return unless (0..max_y - 1).include? position[1]
    return if skip.member? [position, direction]

    visited << position
    skip << [position, direction]

    c = mirrors[position]
    if c.nil?
      travel(max_x,
             max_y,
             [position[0] + direction[0], position[1] + direction[1]],
             direction,
             mirrors,
             skip,
             visited)
    elsif c == '|'
      if direction[0].zero?
        travel(max_x,
               max_y,
               [position[0] + direction[0], position[1] + direction[1]],
               direction,
               mirrors,
               skip,
               visited)
      else
        travel(max_x,
               max_y,
               [position[0], position[1] + 1],
               [0, 1],
               mirrors,
               skip,
               visited)
        travel(max_x,
               max_y,
               [position[0], position[1] - 1],
               [0, -1],
               mirrors,
               skip,
               visited)
      end
    elsif c == '-'
      if direction[1].zero?
        travel(max_x,
               max_y,
               [position[0] + direction[0], position[1] + direction[1]],
               direction,
               mirrors,
               skip,
               visited)
      else
        travel(max_x,
               max_y,
               [position[0] + 1, position[1]],
               [1, 0],
               mirrors,
               skip,
               visited)
        travel(max_x,
               max_y,
               [position[0] - 1, position[1]],
               [-1, 0],
               mirrors,
               skip,
               visited)
      end
    elsif c == '\\'
      travel(max_x,
             max_y,
             [position[0] + direction[1], position[1] + direction[0]],
             [direction[1], direction[0]],
             mirrors,
             skip,
             visited)
    elsif c == '/'
      travel(max_x,
             max_y,
             [position[0] - direction[1], position[1] - direction[0]],
             [-direction[1], -direction[0]],
             mirrors,
             skip,
             visited)
    end
  end

  def self.base(input, position, direction)
    mirrors = {}
    lines = input.split("\n")
    lines.each_with_index do |line, y|
      line.chars.each_with_index do |c, x|
        next if c == '.'

        mirrors[[x, y]] = c
      end
    end

    visited = Set[]
    skip = Set[]

    travel(lines.first.length, lines.length, position, direction, mirrors, skip, visited)

    visited.length
  end

  def self.part1(input)
    base(input, [0, 0], [1, 0])
  end

  def self.part2(input)
    lines = input.split("\n")
    y_max = lines.length
    x_max = lines.first.length
    results = [[1, 0], [0, 1], [-1, 0], [0, -1]].map do |direction|
      if direction[0] == 1
        (0..y_max - 1).map { |y| base(input, [0, y], direction) }
      elsif direction[0] == -1
        (0..y_max - 1).map { |y| base(input, [x_max - 1, y], direction) }
      elsif direction[1] == 1
        (0..x_max - 1).map { |x| base(input, [x, 0], direction) }
      elsif direction[1] == -1
        (0..x_max - 1).map { |x| base(input, [x, y_max - 1], direction) }
      end
    end
    results.flatten.max
  end
end
