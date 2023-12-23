# frozen_string_literal: true

module Day22
  def self.overlap?(a, b)
    b.begin <= a.end && a.begin <= b.end
  end

  def self.parse(input)
    input.split("\n")
         .map { |line| line.split('~').map { |c| c.split(',').map(&:to_i) } }
         .map { |left, right| [left[0]..right[0], left[1]..right[1], left[2]..right[2]] }
         .each_with_index
         .with_object({}) { |k, h| h[k[1]] = k[0] }
  end

  def self.base(input)
    blocks = parse input
    falling = blocks.entries.sort_by { |_, v| v[2].end }.map(&:first)
    settled = [-1]

    until falling.empty?
      v = falling.delete_at(0)
      block = blocks[v]
      distance = settled.map { |b| blocks.fetch(b) { [-1000..1000, -1000..1000, 0..0] } }
                        .filter { |b| overlap?(b[0], block[0]) && overlap?(b[1], block[1]) }
                        .map { |b| block[2].begin - b[2].end }
                        .min
      new_block = [block[0], block[1], (block[2].begin - distance + 1)..(block[2].end - distance + 1)]
      blocks[v] = new_block
      settled << v
    end

    blocks.each_with_object({}) do |e, h|
      k, block = e
      supported_by = []
      supports = []
      blocks.each_key do |o|
        next if o == k

        other = blocks[o]
        supported_by << o if other[2].end + 1 == block[2].begin && (overlap?(other[0], block[0]) && overlap?(other[1], block[1]))
        supports << o if other[2].begin == block[2].end + 1 && (overlap?(other[0], block[0]) && overlap?(other[1], block[1]))
      end

      h[k] = { supports:, supported_by: }
    end
  end

  def self.part1(input)
    support = base input
    support.values.count do |d|
      d[:supports].none? { |s| support[s][:supported_by].length == 1 }
    end
  end

  def self.part2(input)
    support = base input
    support.entries.sum do |k, v|
      falling = Set[k]
      to_check = v[:supports].clone
      until to_check.empty?
        o = to_check.pop

        d = support[o]
        next unless d[:supported_by].all? { |e| falling.member? e }

        falling << o
        d[:supports].each { |e| to_check << e }
      end

      falling.length - 1
    end
  end
end
