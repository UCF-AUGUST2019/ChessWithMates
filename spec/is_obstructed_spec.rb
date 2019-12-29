require 'spec_helper'
require './is_obstructed'

describe Obstructed do
  it 'takes in x & y and returns the sum' do
    calc1 = Obstructed.new
    expect(calc1.add(1, 2)).to eq(3)
    expect(calc1.add(3, 4)).to eq(7)
    expect(calc1.add(5, 6)).to eq(11)
  end
end