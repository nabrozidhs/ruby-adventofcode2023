# frozen_string_literal: true

require 'rspec'
require 'day24'

RSpec.describe Day24 do
  input = <<~INPUT
    19, 13, 30 @ -2,  1, -2
    18, 19, 22 @ -1, -1, -2
    20, 25, 34 @ -2, -2, -4
    12, 31, 28 @ -1, -2, -1
    20, 19, 15 @  1, -5, -3
  INPUT

  it 'part1 succeeds' do
    expect(Day24.part1(input, 7..27)).to eq 2
  end
end
