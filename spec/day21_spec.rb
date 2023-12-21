# frozen_string_literal: true

require 'rspec'
require 'day21'

RSpec.describe Day21 do
  input = <<~INPUT
    ...........
    .....###.#.
    .###.##..#.
    ..#.#...#..
    ....#.#....
    .##..S####.
    .##..#...#.
    .......##..
    .##.#.####.
    .##..##.##.
    ...........
  INPUT

  it 'part1 succeeds' do
    expect(Day21.part1(input, 6)).to eq 16
  end
end
