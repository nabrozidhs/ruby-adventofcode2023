# frozen_string_literal: true

require 'rspec'
require 'day16'

RSpec.describe Day16 do
  input = File.read 'spec/day16_input.txt'

  it 'part1 succeeds' do
    expect(Day16.part1(input)).to eq 46
  end

  it 'part2 succeeds' do
    expect(Day16.part2(input)).to eq 51
  end
end
