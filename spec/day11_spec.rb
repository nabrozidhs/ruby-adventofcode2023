# frozen_string_literal: true

require 'rspec'
require 'day11'

RSpec.describe Day11 do
  input = <<~INPUT
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
  INPUT

  it 'part1 succeeds' do
    expect(Day11.part1(input)).to eq 374
  end

  it 'part2 succeeds' do
    expect(Day11.part2(input, 10)).to eq 1030
    expect(Day11.part2(input, 100)).to eq 8410
  end
end
