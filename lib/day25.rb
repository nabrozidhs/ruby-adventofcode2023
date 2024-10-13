# frozen_string_literal: true

module Day25
  def self.part1(input)
    graph = {}
    input.split("\n").each do |line|
      a, c = line.split(': ')
      c.split.each do |e|
        graph[a] = graph.fetch(a, Set[]).add(e)
        graph[e] = graph.fetch(e, Set[]).add(a)
      end
    end

    s = graph.keys.to_set

    s.delete(s.max_by { |v| (graph[v] - s).length }) while s.map { |v| (graph[v] - s).length }.sum != 3

    s.length * (graph.keys.to_set - s).length
  end
end
