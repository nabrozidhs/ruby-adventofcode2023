# frozen_string_literal: true

module Day17
  def self.part1(input)
    map = input.split("\n").map { |line| line.chars.map(&:to_i) }
    max_x = map.first.length
    max_y = map.length

    end_position = [max_x - 1, max_y - 1]
    visited = Set[]

    queue = [[[0, 0], [1, 0], 0, 0], [[0, 0], [0, 1], 0, 0]]
    until queue.empty?
      queue.sort_by! { |_, _, _, heat| heat }
      position, direction, steps, heat_loss = queue.delete_at 0

      return heat_loss if position == end_position

      next if visited.member?([position, direction, steps])

      visited << [position, direction, steps]

      [direction,
       [direction[1], -direction[0]],
       [-direction[1], direction[0]]].each do |new_direction|
        next if new_direction == direction && steps >= 3

        new_position = [position[0] + new_direction[0], position[1] + new_direction[1]]
        next unless (0..max_x - 1).member?(new_position[0]) && (0..max_y - 1).member?(new_position[1])

        new_steps = direction == new_direction ? steps + 1 : 1
        next if visited.member?([new_position, new_direction, new_steps])

        queue << [new_position,
                  new_direction,
                  new_steps,
                  heat_loss + map[new_position[1]][new_position[0]]]
      end
    end
  end

  def self.part2(input)
    map = input.split("\n").map { |line| line.chars.map(&:to_i) }
    max_x = map.first.length
    max_y = map.length

    end_position = [max_x - 1, max_y - 1]
    visited = Set[]

    queue = [[[0, 0], [1, 0], 0, 0], [[0, 0], [0, 1], 0, 0]]
    until queue.empty?
      queue.sort_by! { |_, _, _, heat| heat }
      position, direction, steps, heat_loss = queue.delete_at 0

      return heat_loss if position == end_position && steps >= 4

      next if visited.member?([position, direction, steps])

      visited << [position, direction, steps]

      [direction,
       [direction[1], -direction[0]],
       [-direction[1], direction[0]]].each do |new_direction|
        next if new_direction == direction && steps >= 10
        next if new_direction != direction && steps < 4

        new_position = [position[0] + new_direction[0], position[1] + new_direction[1]]
        next unless (0..max_x - 1).member?(new_position[0]) && (0..max_y - 1).member?(new_position[1])

        new_steps = direction == new_direction ? steps + 1 : 1
        next if visited.member?([new_position, new_direction, new_steps])

        queue << [new_position,
                  new_direction,
                  new_steps,
                  heat_loss + map[new_position[1]][new_position[0]]]
      end
    end
  end
end
