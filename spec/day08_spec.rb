# frozen_string_literal: true

require 'rspec'
require 'day08'

RSpec.describe Day08 do
  input = <<~INPUT
    RL

    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
  INPUT

  input2 = <<~INPUT
    LR

    11A = (11B, XXX)
    11B = (XXX, 11Z)
    11Z = (11B, XXX)
    22A = (22B, XXX)
    22B = (22C, 22C)
    22C = (22Z, 22Z)
    22Z = (22B, 22B)
    XXX = (XXX, XXX)
  INPUT

  it 'part1 succeeds' do
    expect(Day08.part1(input)).to eq 2
  end

  it 'part2 succeeds' do
    expect(Day08.part2(input2)).to eq 6
  end
end
