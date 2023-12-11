# frozen_string_literal: true

module Day10
  def self.find_start_position(lines)
    (0..lines.length - 1).each do |y|
      (0..lines[y].length - 1).each do |x|
        return [x, y] if lines[y][x] == 'S'
      end
    end
  end

  def self.find_path(input, start_direction)
    lines = input.split("\n").map(&:chars)
    start = find_start_position lines
    current = start
    path = [current]
    direction = start_direction
    while start != [current[0] + direction[0], current[1] + direction[1]]
      current = [current[0] + direction[0], current[1] + direction[1]]
      path << current
      direction = case lines[current[1]][current[0]]
                  when 'F'
                    direction[0] == -1 ? [0, 1] : [1, 0]
                  when 'J'
                    direction[0] == 1 ? [0, -1] : [-1, 0]
                  when '7'
                    direction[0] == 1 ? [0, 1] : [-1, 0]
                  when 'L'
                    direction[0] == -1 ? [0, -1] : [1, 0]
                  else
                    direction
                  end
    end
    path
  end

  def self.part1(input, start_direction)
    find_path(input, start_direction).length / 2
  end

  def self.horizontal_crossings(path, position)
    (0..path.length - 1).count do |i|
      left = path[i]
      right = path[(i + 1) % path.length]
      if left[1] == right[1] || left[0] >= position[0]
        false
      else
        y_min = [left[1], right[1]].min
        y_max = [left[1], right[1]].max
        (y_min..(y_max - 1)).include?(position[1])
      end
    end
  end

  def self.part2(input, start_direction)
    path = find_path(input, start_direction)
    path_set = path.to_set
    lines = input.split("\n").map(&:chars)
    result = lines.each_with_index.map do |line, y|
      (0..line.length - 1).count do |x|
        !path_set.include?([x, y]) && horizontal_crossings(path, [x, y]).odd?
      end
    end
    result.sum
  end
end
