# frozen_string_literal: true

module Day20
  def self.part1(input)
    flip_flops = {}
    conjuctions = {}

    modules = input.split("\n")
                   .map { |line| line.split(' -> ') }
                   .map { |a, b| [a, b.split(', ')] }
                   .each_with_object({}) { |e, h| h[e[0]] = e[1] }

    modules.each_key do |key|
      next unless key.start_with? '&'

      m = key[1..]
      conjuctions[m] = modules.entries
                              .filter { |_, b| b.member? m }
                              .each_with_object({}) { |e, h| h[e[0][1..]] = 0 }
    end

    count_highs = 0
    count_lows = 0

    1000.times do
      q = [['broadcaster', ['button', 0]]]
      until q.empty?
        m, from = q.delete_at 0
        from_m, s = from
        if s.zero?
          count_lows += 1
        else
          count_highs += 1
        end

        if modules.member? m
          modules[m].each { |e| q << [e, [m, s]] }
        elsif modules.member?("%#{m}") && s.zero?
          old = flip_flops.fetch(m, 0)
          flip_flops[m] = old.zero? ? 1 : 0
          modules["%#{m}"].each { |e| q << [e, [m, flip_flops[m]]] }
        elsif modules.member?("&#{m}")
          conjuctions[m][from_m] = s
          v = conjuctions[m].values.all? { |e| e == 1 } ? 0 : 1
          modules["&#{m}"].each { |e| q << [e, [m, v]] }
        end
      end
    end
    count_highs * count_lows
  end

  def self.part2(input)
    modules = input.split("\n")
                   .map { |line| line.split(' -> ') }
                   .map { |a, b| [a, b.split(', ')] }
                   .each_with_object({}) { |e, h| h[e[0]] = e[1] }

    # This modules pointing to rx need to be updated manually
    result = %w[xc th pd bp].map do |m_to_find|
      flip_flops = {}
      conjuctions = {}
      modules.each_key do |key|
        next unless key.start_with? '&'

        m = key[1..]
        conjuctions[m] = modules.entries
                                .filter { |_, b| b.member? m }
                                .each_with_object({}) { |e, h| h[e[0][1..]] = 0 }
      end

      found = 0
      100_000.times do |i|
        break unless found.zero?

        q = [['broadcaster', ['button', 0]]]
        until q.empty?
          m, from = q.delete_at 0
          from_m, s = from

          if s.zero? && m == m_to_find
            found = i + 1
            puts(found)
            break
          end

          if modules.member? m
            modules[m].each { |e| q << [e, [m, s]] }
          elsif modules.member?("%#{m}") && s.zero?
            old = flip_flops.fetch(m, 0)
            flip_flops[m] = old.zero? ? 1 : 0
            modules["%#{m}"].each { |e| q << [e, [m, flip_flops[m]]] }
          elsif modules.member?("&#{m}")
            conjuctions[m][from_m] = s
            v = conjuctions[m].values.all? { |e| e == 1 } ? 0 : 1
            modules["&#{m}"].each { |e| q << [e, [m, v]] }
          end
        end
      end
      found
    end
    result.inject(&:*)
  end
end
