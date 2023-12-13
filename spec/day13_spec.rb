# frozen_string_literal: true

require 'rspec'
require 'day13'

RSpec.describe Day13 do
  input = <<~INPUT
    #.##..##.
    ..#.##.#.
    ##......#
    ##......#
    ..#.##.#.
    ..##..##.
    #.#.##.#.

    #...##..#
    #....#..#
    ..##..###
    #####.##.
    #####.##.
    ..##..###
    #....#..#
  INPUT

  it 'part1 succeeds' do
    expect(Day13.part1(input)).to eq 405
  end

  it 'part2 succeeds' do
    expect(Day13.part2(input)).to eq 400
  end
end
