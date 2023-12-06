# frozen_string_literal: true

module Day06
  def self.base(races)
    wins = races.map do |time, distance|
      (1..(time - 1)).filter { |hold| (time - hold) * hold > distance }
                     .length
    end

    wins.inject(1) { |a, b| a * b }
  end

  def self.part1(input)
    time, distance = input.split("\n").map { |line| line.scan(/\d+/).map(&:to_i) }
    races = time.zip(distance)

    base(races)
  end

  def self.part2(input)
    time, distance = input.split("\n")
                          .map { |line| line.scan(/\d+/).inject('') { |a, b| a + b }.to_i }
    races = [[time, distance]]

    base(races)
  end
end
