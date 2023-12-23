# frozen_string_literal: true

module Day23
  def self.find_start_position(board)
    board.first.each_with_index do |c, x|
      return [x, 0] if c == '.'
    end
  end

  def self.find_end_position(board)
    board.last.each_with_index do |c, x|
      return [x, board.length - 1] if c == '.'
    end
  end

  def self.base(input, skip_slopes)
    board = input.split("\n").map(&:chars)
    start_position = find_start_position board
    end_position = find_end_position board

    max_found = 0
    q = [[start_position, Set[]]]
    until q.empty?
      current_position, visited = q.pop
      visited << current_position

      if current_position == end_position
        max_found = visited.length if max_found < visited.length
        next
      end

      to_add = []
      [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |direction|
        new_position = [current_position[0] + direction[0], current_position[1] + direction[1]]
        next if visited.member? new_position
        next if board[new_position[1]][new_position[0]] == '#'

        unless skip_slopes
          next if direction == [1, 0] && board[new_position[1]][new_position[0]] == '<'
          next if direction == [-1, 0] && board[new_position[1]][new_position[0]] == '>'
          next if direction == [0, -1] && board[new_position[1]][new_position[0]] == 'v'
          next if direction == [0, 1] && board[new_position[1]][new_position[0]] == '^'
        end

        to_add << new_position
      end

      to_add.each_with_index do |p, i|
        q << [p, i.zero? ? visited : visited.clone]
      end
    end

    max_found - 1
  end

  def self.part1(input)
    base(input, false)
  end

  def self.part2(input)
    base(input, true)
  end
end
