# frozen_string_literal: true

require 'rspec'
require 'day06'

RSpec.describe Day06 do
  input = <<~INPUT
    Time:      7  15   30
    Distance:  9  40  200
  INPUT

  it 'part1 succeeds' do
    expect(Day06.part1(input)).to eq 288
  end

  it 'part2 succeeds' do
    expect(Day06.part2(input)).to eq 71_503
  end
end
