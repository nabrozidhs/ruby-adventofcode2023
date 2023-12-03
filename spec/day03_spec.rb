# frozen_string_literal: true

require 'rspec'
require 'day03'

RSpec.describe Day03 do
  input = <<~INPUT
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
  INPUT

  it 'part1 succeeds' do
    expect(Day03.part1(input)).to eq 4_361
  end

  it 'part2 succeeds' do
    expect(Day03.part2(input)).to eq 467_835
  end
end
