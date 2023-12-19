# frozen_string_literal: true

module Day19
  def self.parse(input)
    workflows, parts = input.split("\n\n")

    workflows = workflows.split("\n").map do |workflow|
      name, workflow = workflow.split('{')
      conditions = workflow[0..-2].split(',').map { |cond| cond.split(':') }
      [name, conditions]
    end
    workflows = workflows.each_with_object({}) { |k, h| h[k[0]] = k[1] }

    parts = parts.split("\n").map do |part|
      part[1..-2].split(',')
                 .map { |l| l.split('=') }
                 .each_with_object({}) { |k, h| h[k[0]] = k[1].to_i }
    end

    [workflows, parts]
  end

  def self.part1(input)
    workflows, parts = parse input

    filtered = parts.filter do |_p|
      current = 'in'
      while workflows.member? current
        wf = workflows[current]
        n = wf.find { |a, d| d.nil? || eval("_p[\"#{a[0]}\"]#{a[1..]}") }
        current = n.length == 2 ? n[1] : n[0]
      end
      current == 'A'
    end

    filtered.sum { |part| part.values.sum }
  end

  def self.part2(input)
    workflows, = parse input

    q = [['in', { 'x' => 1..4000, 'm' => 1..4000, 'a' => 1..4000, 's' => 1..4000 }]]
    sum = 0
    until q.empty?
      wf, p = q.pop

      next if wf == 'R'

      if wf == 'A'
        sum += p.values.map(&:size).inject(&:*)
        next
      end

      workflows[wf].each do |a, b|
        if b.nil?
          q << [a, p]
          next
        end

        new_p = p.clone
        r = p[a[0]]
        if a[1] == '<'
          new_p[a[0]] = r.begin..a[2..].to_i - 1
          p[a[0]] = a[2..].to_i..r.end
        else
          new_p[a[0]] = (a[2..].to_i + 1)..r.end
          p[a[0]] = r.begin..a[2..].to_i
        end
        q << [b, new_p]
      end
    end

    sum
  end
end
