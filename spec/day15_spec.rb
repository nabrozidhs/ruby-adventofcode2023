# frozen_string_literal: true

require 'rspec'
require 'day15'

RSpec.describe Day15 do
  input = <<~INPUT
    rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
  INPUT

  it 'part1 succeeds' do
    expect(Day15.part1(input)).to eq 1320
  end

  it 'part2 succeeds' do
    expect(Day15.part2(input)).to eq 145
  end
end
