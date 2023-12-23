# frozen_string_literal: true

require 'rspec'
require 'day22'

RSpec.describe Day22 do
  input = <<~INPUT
    1,0,1~1,2,1
    0,0,2~2,0,2
    0,2,3~2,2,3
    0,0,4~0,2,4
    2,0,5~2,2,5
    0,1,6~2,1,6
    1,1,8~1,1,9
  INPUT

  it 'part1 succeeds' do
    expect(Day22.part1(input)).to eq 5
  end

  it 'part2 succeeds' do
    expect(Day22.part2(input)).to eq 7
  end
end
