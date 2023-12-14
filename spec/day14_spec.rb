# frozen_string_literal: true

require 'rspec'
require 'day14'

RSpec.describe Day14 do
  input = <<~INPUT
    O....#....
    O.OO#....#
    .....##...
    OO.#O....O
    .O.....O#.
    O.#..O.#.#
    ..O..#O..O
    .......O..
    #....###..
    #OO..#....
  INPUT

  it 'part1 succeeds' do
    expect(Day14.part1(input)).to eq 136
  end

  it 'part2 succeeds' do
    expect(Day14.part2(input)).to eq 64
  end
end
