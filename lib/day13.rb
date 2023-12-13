# frozen_string_literal: true

module Day13
  def self.ld(s, t)
    v0 = (0..t.length).to_a
    v1 = []

    s.chars.each_with_index do |s_ch, i|
      v1[0] = i + 1

      t.chars.each_with_index do |t_ch, j|
        cost = s_ch == t_ch ? 0 : 1
        v1[j + 1] = [v1[j] + 1, v0[j + 1] + 1, v0[j] + cost].min
      end
      v0 = v1.dup
    end

    v0[t.length]
  end

  def self.find_reflection_line(lines, part2)
    (1..lines.length - 1).each do |i|
      distance = [i, lines.length - i].min

      smudge_fixed = false
      all_same = (0..distance - 1).all? do |k|
        diff = ld(lines[i - distance + k], lines[i + distance - 1 - k])
        if diff.zero?
          true
        elsif part2 && diff == 1 && !smudge_fixed
          smudge_fixed = true
          true
        else
          false
        end
      end

      return i if all_same && (!part2 || smudge_fixed)
    end

    nil
  end

  def self.group(group, part2)
    rows = group.split("\n")

    r = find_reflection_line(rows, part2)
    return r * 100 if r

    columns = []
    (0..rows.first.length - 1).each do |x|
      columns << ''
      (0..rows.length - 1).each do |y|
        columns[x] = columns[x] + rows[y][x]
      end
    end
    find_reflection_line(columns, part2)
  end

  def self.part1(input)
    input.split("\n\n").map { |group| group(group, false) }.sum
  end

  def self.part2(input)
    input.split("\n\n").map { |group| group(group, true) }.sum
  end
end
