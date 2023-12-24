# frozen_string_literal: true

module Day24
  def self.line_equation(p1)
    slope = p1[1][1].to_f / p1[1][0]
    x0 = -p1[0][0].to_f / p1[1][0]
    y0 = p1[0][1].to_f + (x0 * p1[1][1])

    [slope, y0]
  end

  def self.intersection(p1, p2)
    slope1, y1 = line_equation p1
    slope2, y2 = line_equation p2
    return nil if slope1 == slope2

    x = (y2 - y1) / (slope1 - slope2)
    y = (slope1 * x) + y1

    [x, y]
  end

  def self.parse(input)
    input.split("\n")
         .map { |r| r.split(' @ ').map { |e| e.split(', ').map(&:to_i) } }
  end

  def self.will_reach_in_future(line, p)
    x = line[0][0]
    y = line[0][1]
    return false unless ((line[1][0].negative? ? -Float::INFINITY : x)..(line[1][0].negative? ? x : Float::INFINITY)).member? p[0]
    return false unless ((line[1][1].negative? ? -Float::INFINITY : y)..(line[1][1].negative? ? y : Float::INFINITY)).member? p[1]

    true
  end

  def self.part1(input, r)
    lines = parse input
    sum = 0
    (0...lines.length - 1).each do |i|
      (i + 1...lines.length).each do |j|
        p = intersection(lines[i], lines[j])
        next if p.nil?
        next unless r.member?(p[0]) && r.member?(p[1])
        next unless will_reach_in_future(lines[i], p)
        next unless will_reach_in_future(lines[j], p)

        sum += 1
      end
    end
    sum
  end
end
