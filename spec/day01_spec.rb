# frozen_string_literal: true

require 'rspec'
require 'day01'

RSpec.describe Day01 do
  input = <<~INPUT
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
  INPUT

  input2 = <<~INPUT2
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
  INPUT2

  it 'part1 succeeds' do
    expect(Day01.part1(input)).to eq 142
  end

  it 'part2 succeeds' do
    expect(Day01.part2(input2)).to eq 281
  end
end
