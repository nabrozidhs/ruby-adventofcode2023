# frozen_string_literal: true

module Day09
  def self.base(input, &f)
    lines = input.split("\n").map { |line| line.split.map(&:to_i) }

    results = lines.map do |line|
      steps = [line]
      until steps.last.all? { |x| x == steps.last.first }
        new_line = (0..(steps.last.length - 2)).map { |index| steps.last[index + 1] - steps.last[index] }
        steps << new_line
      end

      f.call(steps)
    end

    results.sum
  end

  def self.part1(input)
    base(input) { |steps| steps.map(&:last).sum }
  end

  def self.part2(input)
    base(input) { |steps| steps.map(&:first).reverse.inject(0) { |a, b| b - a } }
  end
end
