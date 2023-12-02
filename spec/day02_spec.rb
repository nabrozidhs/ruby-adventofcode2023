# frozen_string_literal: true

require 'rspec'
require 'day02'

RSpec.describe Day02 do
  input = <<~INPUT
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  INPUT

  it 'part1 succeeds' do
    expect(Day02.part1(input)).to eq 8
  end

  it 'part2 succeeds' do
    expect(Day02.part2(input)).to eq 2286
  end
end
