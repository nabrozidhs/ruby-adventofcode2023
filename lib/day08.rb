# frozen_string_literal: true

module Day08
  def self.part1(input)
    steps, nodes_input = input.split("\n\n")

    nodes = {}
    nodes_input.split("\n").each do |n|
      node, left, right = n.scan(/\w+/)
      nodes[node] = [left, right]
    end

    current = 'AAA'
    (0..(2**32)).find do |index|
      current = nodes[current][steps[index % steps.length] == 'L' ? 0 : 1]
      current == 'ZZZ'
    end + 1
  end

  def self.part2(input)
    steps, nodes_input = input.split("\n\n")

    nodes = {}
    nodes_input.split("\n").each do |n|
      node, left, right = n.scan(/\w+/)
      nodes[node] = [left, right]
    end

    cycles = nodes.keys
                  .filter { |node| node.end_with? 'A' }
                  .map do |position|
      current = position
      (0..(2**32)).find do |index|
        current = nodes[current][steps[index % steps.length] == 'L' ? 0 : 1]
        current.end_with? 'Z'
      end + 1
    end

    cycles.inject(1) { |a, b| a.lcm(b) }
  end
end
