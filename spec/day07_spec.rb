# frozen_string_literal: true

require 'rspec'
require 'day07'

RSpec.describe Day07 do
  input = <<~INPUT
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
  INPUT

  it 'part1 succeeds' do
    expect(Day07.part1(input)).to eq 6440
  end

  it 'part2 succeeds' do
    expect(Day07.part2(input)).to eq 5905
  end
end
