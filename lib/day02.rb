# frozen_string_literal: true

module Day02
  def self.part1(input)
    configuration = {
      red: 12,
      green: 13,
      blue: 14
    }

    filtered = input.split("\n")
                    .each_with_index
                    .filter do |line, _|
      line.scan(/(\d+) (red|green|blue)/)
          .all? { |count, color| count.to_i <= configuration[color.to_sym] }
    end

    filtered.map { |_, index| index + 1 }.sum
  end

  def self.part2(input)
    mapped = input.split("\n")
                  .map do |line|
      cubes = {}
      line.scan(/(\d+) (red|green|blue)/)
          .map { |count, color| [count.to_i, color.to_sym] }
          .each { |count, color| cubes[color] = count if count > cubes.fetch(color, 0) }
      cubes.values.inject(1) { |a, b| a * b }
    end

    mapped.sum
  end
end
