# frozen_string_literal: true

module Day12
  @cache = {}

  def self.arrangements(arrangement, codes)
    if arrangement.empty?
      codes.empty? ? 1 : 0
    elsif arrangement[0] == '.'
      arrangements(arrangement[1..], codes)
    elsif arrangement[0] == '?'
      @cache[[arrangement, codes]] ||= arrangements(arrangement[1..], codes) + arrangements("##{arrangement[1..]}", codes)
    elsif codes.empty? ||
          arrangement.length < codes.first ||
          arrangement[0..(codes.first - 1)].chars.any? { |c| c == '.' } ||
          arrangement[codes.first] == '#'
      0
    elsif arrangement.length == codes.first
      codes.length == 1 && arrangement.chars.all? { |c| c != '.' } ? 1 : 0
    else
      arrangements(arrangement[codes.first + 1..], codes.drop(1))
    end
  end

  def self.base(lines)
    lines.map(&:split).map { |arrangement, codes| arrangements(arrangement, codes.split(',').map(&:to_i)) }.sum
  end

  def self.part1(input)
    base(input.split("\n"))
  end

  def self.part2(input)
    base(input.split("\n").map(&:split).map { |a, b| "#{([a] * 5).join '?'} #{([b] * 5).join ','}" })
  end
end
