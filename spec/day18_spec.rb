# frozen_string_literal: true

require 'rspec'
require 'day18'

RSpec.describe Day18 do
  input = <<~INPUT
    R 6 (#70c710)
    D 5 (#0dc571)
    L 2 (#5713f0)
    D 2 (#d2c081)
    R 2 (#59c680)
    D 2 (#411b91)
    L 5 (#8ceee2)
    U 2 (#caa173)
    L 1 (#1b58a2)
    U 2 (#caa171)
    R 2 (#7807d2)
    U 3 (#a77fa3)
    L 2 (#015232)
    U 2 (#7a21e3)
  INPUT

  it 'part1 succeeds' do
    expect(Day18.part1(input)).to eq 62
  end

  it 'part2 succeeds' do
    expect(Day18.part2(input)).to eq 952_408_144_115
  end
end
