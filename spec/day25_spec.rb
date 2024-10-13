# frozen_string_literal: true

require 'rspec'
require 'day25'

RSpec.describe Day25 do
  input = <<~INPUT
    jqt: rhn xhk nvd
    rsh: frs pzl lsr
    xhk: hfx
    cmg: qnr nvd lhk bvb
    rhn: xhk bvb hfx
    bvb: xhk hfx
    pzl: lsr hfx nvd
    qnr: nvd
    ntq: jqt hfx bvb xhk
    nvd: lhk
    lsr: lhk
    rzs: qnr cmg lsr rsh
    frs: qnr lhk lsr
  INPUT

  it 'part1 succeeds' do
    expect(Day25.part1(input)).to eq 54
  end
end
