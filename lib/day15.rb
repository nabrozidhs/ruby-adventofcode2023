# frozen_string_literal: true

module Day15
  def self.hash(input)
    input.chars.inject(0) { |acc, c| ((acc + c.ord) * 17) % 256 }
  end

  def self.part1(input)
    input.strip.split(',').map { |line| hash(line) }.sum
  end

  def self.part2(input)
    boxes = []
    256.times { boxes << [] }

    input.strip.split(',').each do |line|
      if line.include? '-'
        label = line.split('-')[0]
        boxes[hash(label)].delete_if { |l, _| l == label }
      else
        label, focal_string = line.split('=')
        focal = focal_string.to_i
        box = boxes[hash(label)]
        found = box.find { |l, _| l == label }
        if found.nil?
          box << [label, focal]
        else
          found[1] = focal
        end
      end
    end

    boxes.each_with_index.sum do |box, i|
      box.each_with_index.sum { |item, k| (i + 1) * (k + 1) * item[1] }
    end
  end
end
