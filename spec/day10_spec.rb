# frozen_string_literal: true

require 'rspec'
require 'day10'

RSpec.describe Day10 do
  input = <<~INPUT
    .....
    .S-7.
    .|.|.
    .L-J.
    .....
  INPUT

  input2 = <<~INPUT2
    ...........
    .S-------7.
    .|F-----7|.
    .||.....||.
    .||.....||.
    .|L-7.F-J|.
    .|..|.|..|.
    .L--J.L--J.
    ...........
  INPUT2

  input3 = <<~INPUT3
    ..........
    .S------7.
    .|F----7|.
    .||....||.
    .||....||.
    .|L-7F-J|.
    .|..||..|.
    .L--JL--J.
    ..........
  INPUT3

  input4 = <<~INPUT4
    .F----7F7F7F7F-7....
    .|F--7||||||||FJ....
    .||.FJ||||||||L7....
    FJL7L7LJLJ||LJ.L-7..
    L--J.L7...LJS7F-7L7.
    ....F-J..F7FJ|L7L7L7
    ....L7.F7||L7|.L7L7|
    .....|FJLJ|FJ|F7|.LJ
    ....FJL-7.||.||||...
    ....L---J.LJ.LJLJ...
  INPUT4

  input5 = <<~INPUT5
    FF7FSF7F7F7F7F7F---7
    L|LJ||||||||||||F--J
    FL-7LJLJ||||||LJL-77
    F--JF--7||LJLJ7F7FJ-
    L---JF-JLJ.||-FJLJJ7
    |F|F-JF---7F7-L7L|7|
    |FFJF7L7F-JF7|JL---7
    7-L-JL7||F7|L7F-7F7|
    L.L7LFJ|||||FJL7||LJ
    L7JLJL-JLJLJL--JLJ.L
  INPUT5

  it 'part1 succeeds' do
    expect(Day10.part1(input, [0, 1])).to eq 4
  end

  it 'part2 succeeds' do
    expect(Day10.part2(input2, [0, 1])).to eq 4
    expect(Day10.part2(input3, [0, 1])).to eq 4
    expect(Day10.part2(input4, [0, 1])).to eq 8
    expect(Day10.part2(input5, [0, 1])).to eq 10
  end
end
