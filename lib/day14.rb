# frozen_string_literal: true

module Day14
  def self.move(y_max, x_max, rocks, blocks, direction)
    (direction[1] == -1 ? (0..y_max - 1) : (y_max - 1).downto(0)).each do |y|
      (direction[0] == -1 ? (0..x_max - 1) : (x_max - 1).downto(0)).each do |x|
        next unless rocks.member? [x, y]

        rocks.delete [x, y]
        new_y = y
        new_x = x
        new_x += direction[0] while (0..x_max - 1).member?(new_x) && !rocks.member?([new_x, y]) && !blocks.member?([new_x, y]) unless direction[0].zero?
        new_y += direction[1] while (0..(y_max - 1)).member?(new_y) && !rocks.member?([x, new_y]) && !blocks.member?([x, new_y]) unless direction[1].zero?
        rocks << [new_x - direction[0], new_y - direction[1]]
      end
    end
  end

  def self.parse(input)
    rocks = Set[]
    blocks = Set[]

    lines = input.split("\n")
    lines.each_with_index do |line, y|
      line.chars.each_with_index do |c, x|
        if c == '#'
          blocks << [x, y]
        elsif c == 'O'
          rocks << [x, y]
        end
      end
    end

    [lines.length, lines.first.length, rocks, blocks]
  end

  def self.part1(input)
    y_max, x_max, rocks, blocks = parse(input)

    move(y_max, x_max, rocks, blocks, [0, -1])

    rocks.sum { |_, y| y_max - y }
  end

  def self.cycle(y_max, x_max, rocks, blocks)
    [[0, -1], [-1, 0], [0, 1], [1, 0]].each { |direction| move(y_max, x_max, rocks, blocks, direction) }
  end

  def self.part2(input)
    y_max, x_max, rocks, blocks = parse(input)

    cache = {}
    cycle = 0
    offset = 0
    iterations = 1_000_000_000
    (1..iterations).each do |i|
      seen_at = cache[rocks.clone]
      if seen_at.nil?
        cache[rocks.clone] = i
        cycle(y_max, x_max, rocks, blocks)
      else
        offset = seen_at
        cycle = i - seen_at
        break
      end
    end

    (1..(((iterations - offset) % cycle) + 1)).each do
      cycle(y_max, x_max, rocks, blocks)
    end

    rocks.sum { |_, y| y_max - y }
  end
end
