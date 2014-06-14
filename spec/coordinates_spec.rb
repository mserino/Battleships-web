require 'coordinates'


describe Coordinates do
  let(:a1) { Coordinate.new(:A1) }
  let(:a2) { Coordinate.new(:A2) }
  let(:b1) { Coordinate.new(:B1) }
  let(:j1) { Coordinate.new(:J1) }

  it 'has one position' do
    expect(Coordinates.new(a1).count).to eq 1
  end

  it 'can have more than one position' do
    expect(Coordinates.new(a1, a2).count).to eq 2
  end

  it 'tells us if a coordinate is included' do
    expect(Coordinates.new(a1)).to include a1
  end

  it 'this cannot happen' do
    expect{Coordinates.new(b1, a1, j1)}.to raise_error
  end
end
