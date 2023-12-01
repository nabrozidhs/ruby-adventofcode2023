# frozen_string_literal: true

def base(input, number_as_letters)
  mapping = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }
  regex = if number_as_letters
            "(\\d|#{mapping.keys.join('|')})"
          else
            '(\\d)'
          end
  input.split("\n")
       .map { |e| [e.match(/#{regex}/).captures.first, e.match(/.*#{regex}.*/).captures.first] }
       .map { |e| e.map { |v| mapping.fetch(v, v).to_i } }
       .map { |e| (e.first * 10) + e.last }
       .sum
end

def part1(input)
  base(input, false)
end

def part2(input)
  base(input, true)
end
