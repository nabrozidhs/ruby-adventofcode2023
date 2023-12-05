# frozen_string_literal: true

module Day05
  def self.base(seeds, input)
    mapping = []
    input.split("\n\n")
         .drop(1)
         .map { |group| group.split("\n") }
         .each do |group|
      ranges = []
      group.drop(1)
           .map { |line| line.scan(/\d+/).map(&:to_i) }
           .each { |range| ranges << range }
      mapping << ranges
    end

    (0..(2**32)).find do |location|
      seed = location

      mapping.reverse.each do |ranges|
        range = ranges.find do |destination, _, length|
          (destination..(destination + length - 1)).member? seed
        end
        seed = range[1] + (seed - range[0]) unless range.nil?
      end

      seeds.any? { |start, length| (start..(start + length - 1)).member? seed }
    end
  end

  def self.part1(input)
    seeds = input.split("\n").first.scan(/\d+/)
                 .map(&:to_i)
                 .map { |seed| [seed, 1] }

    base(seeds, input)
  end

  def self.part2(input)
    parsed = input.split("\n").first.scan(/\d+/).map(&:to_i)
    seeds = (0..(parsed.length / 2) - 1).map { |i| [parsed[2 * i], parsed[(2 * i) + 1]] }

    base(seeds, input)
  end
end
