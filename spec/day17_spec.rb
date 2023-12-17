# frozen_string_literal: true

require 'rspec'
require 'day17'

RSpec.describe Day17 do
  input = <<~INPUT
    2413432311323
    3215453535623
    3255245654254
    3446585845452
    4546657867536
    1438598798454
    4457876987766
    3637877979653
    4654967986887
    4564679986453
    1224686865563
    2546548887735
    4322674655533
  INPUT

  input2 = <<~INPUT2
    111111111111
    999999999991
    999999999991
    999999999991
    999999999991
  INPUT2

  it 'part1 succeeds' do
    expect(Day17.part1(input)).to eq 102
  end

  it 'part2 succeeds' do
    expect(Day17.part2(input)).to eq 94
    expect(Day17.part2(input2)).to eq 71
  end
end
