# frozen_string_literal: true

module Day04
  def self.base(input)
    input.split("\n")
         .map { |line| line.split(":").last }
         .map { |line| line.split("|").map { |g| g.scan(/\d+/) } }
         .map { |card| card.first.to_set.intersection(card.last.to_set) }
  end

  def self.part1(input)
    base(input).map { |common| common.empty? ? 0 : 2 ** (common.length - 1) }
               .sum
  end

  def self.part2(input)
    results = base(input).map(&:length)

    hand = {}

    (0..results.length - 1).each do |index|
      hand[index] = 1 unless hand.include? index
      (index + 1..index + results[index]).each { |n| hand[n] = hand.fetch(n, 1) + hand[index] }
    end

    hand.values.sum
  end
end
