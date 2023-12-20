# frozen_string_literal: true

require 'rspec'
require 'day20'

RSpec.describe Day20 do
  input = <<~INPUT
    broadcaster -> a, b, c
    %a -> b
    %b -> c
    %c -> inv
    &inv -> a
  INPUT

  input2 = <<~INPUT2
    broadcaster -> a
    %a -> inv, con
    &inv -> b
    %b -> con
    &con -> output
  INPUT2

  it 'part1 succeeds' do
    expect(Day20.part1(input)).to eq 32_000_000
    expect(Day20.part1(input2)).to eq 11_687_500
  end
end
