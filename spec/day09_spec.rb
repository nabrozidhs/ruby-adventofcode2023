# frozen_string_literal: true

require 'rspec'
require 'day09'

RSpec.describe Day09 do
  input = <<~INPUT
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
  INPUT

  it 'part1 succeeds' do
    expect(Day09.part1(input)).to eq 114
  end

  it 'part2 succeeds' do
    expect(Day09.part2(input)).to eq 2
  end
end
