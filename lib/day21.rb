# frozen_string_literal: true

module Day21
  def self.find_start_position(board)
    board.each_with_index do |line, y|
      line.chars.each_with_index do |c, x|
        return [x, y] if c == 'S'
      end
    end
  end

  def self.part1(input, max_steps)
    board = input.split "\n"
    start_position = find_start_position board
    q = Set[start_position]
    max_steps.times do
      new_q = Set[]
      q.each do |p|
        [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |direction|
          new_p = [p[0] + direction[0], p[1] + direction[1]]
          next unless (0..board.length - 1).member?(new_p[0]) # check x
          next unless (0..board.first.length - 1).member?(new_p[1]) # check y
          next if board[new_p[1]][new_p[0]] == '#'

          new_q << new_p
        end
      end
      q = new_q
    end
    q.length
  end
end
