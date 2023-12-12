# frozen_string_literal: true

require 'rspec'
require 'day12'

RSpec.describe Day12 do
  input = <<~INPUT
    ???.### 1,1,3
    .??..??...?##. 1,1,3
    ?#?#?#?#?#?#?#? 1,3,1,6
    ????.#...#... 4,1,1
    ????.######..#####. 1,6,5
    ?###???????? 3,2,1
  INPUT

  it 'part1 succeeds' do
    expect(Day12.part1(input)).to eq 21
  end

  it 'part2 succeeds' do
    expect(Day12.part2('???.### 1,1,3')).to eq 1
    expect(Day12.part2('.??..??...?##. 1,1,3')).to eq 16_384
    expect(Day12.part2('?#?#?#?#?#?#?#? 1,3,1,6')).to eq 1
    expect(Day12.part2('????.#...#... 4,1,1')).to eq 16
    expect(Day12.part2('????.######..#####. 1,6,5')).to eq 2500
    expect(Day12.part2('.#?.#?.#?.#?.# 1,1,1,1,1')).to eq 1
  end
end
