# frozen_string_literal: true

module Day07
  def self.sort_type1(hand)
    grouped = hand.chars.group_by { |x| x }.values.sort_by(&:length).reverse
    if grouped.first.length == 5
      6
    elsif grouped.first.length == 4
      5
    elsif grouped.first.length == 3 && grouped[1].length == 2
      4
    elsif grouped.first.length == 3
      3
    elsif grouped.first.length == 2 && grouped[1].length == 2
      2
    elsif grouped.first.length == 2
      1
    else
      0
    end
  end

  def self.sort_type2(hand)
    %w[2 3 4 5 6 7 8 9 T Q K A].map { |c| sort_type1(hand.gsub('J', c)) }.max
  end

  def self.sort_cards1(a)
    %w[2 3 4 5 6 7 8 9 T J Q K A].find_index a
  end

  def self.sort_cards2(a)
    %w[J 2 3 4 5 6 7 8 9 T Q K A].find_index a
  end

  def self.sort_hands(a, b, &f)
    left, right = a.chars.zip(b.chars).find { |l, r| l != r }
    f.call(left) <=> f.call(right)
  end

  def self.base(input, &f)
    hands = input.split("\n").map do |line|
      hand, value = line.split
      [hand, value.to_i]
    end
    f.call(hands)
     .each_with_index
     .map { |hand, index| hand.last * (index + 1) }
     .sum
  end

  def self.part1(input)
    base(input) do |hands|
      hands.sort do |a, b|
        type_a = sort_type1(a.first)
        type_b = sort_type1(b.first)
        if type_a == type_b
          sort_hands(a.first, b.first) { |x| sort_cards1(x) }
        else
          type_a <=> type_b
        end
      end
    end
  end

  def self.part2(input)
    base(input) do |hands|
      hands.sort do |a, b|
        type_a = sort_type2(a.first)
        type_b = sort_type2(b.first)
        if type_a == type_b
          sort_hands(a.first, b.first) { |x| sort_cards2(x) }
        else
          type_a <=> type_b
        end
      end
    end
  end
end
