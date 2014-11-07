require 'spec_helper'

describe Rover::Coordinate do
  describe 'after initialization' do
    it "has an x coordinate" do
      coordinate = Rover::Coordinate.new(1, 3)
      expect(coordinate.x).to be == 1
    end

    it "has an y coordinate" do
      coordinate = Rover::Coordinate.new(1, 3)
      expect(coordinate.y).to be == 3
    end
  end

  describe '#valid?' do
    it "is true when the x and y are greater than or equal to 0" do
      coordinate = Rover::Coordinate.new(1, 1)
      expect(coordinate.valid?).to be == true
    end

    it "is false when the x coordinate is less than 0" do
      coordiate = Rover::Coordinate.new(-1, 1)
      expect(coordiate.valid?).to be == false
    end

    it "is false when the y coordinate is less than 0" do
      coordiate = Rover::Coordinate.new(1, -1)
      expect(coordiate.valid?).to be == false
    end
  end

  it "#east will return a new coordinate with the same y, but an x that is one greater" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.east
    expect(eastern_coordinate.x).to be == 4
    expect(eastern_coordinate.y).to be == 3
  end

  it "#west will return a new coordinate with the same y, but an x that is one less" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.west
    expect(eastern_coordinate.x).to be == 2
    expect(eastern_coordinate.y).to be == 3
  end

  it "#south will return a new coordinate with one less in the y direction, but an x is same" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.south
    expect(eastern_coordinate.x).to be == 3
    expect(eastern_coordinate.y).to be == 2
  end

  it "#north will return a new coordinate with one greater in the y direction, but an x is same" do
    coordinate = Rover::Coordinate.new(3,3)
    eastern_coordinate = coordinate.north
    expect(eastern_coordinate.x).to be == 3
    expect(eastern_coordinate.y).to be == 4
  end

  describe '#==' do
    context "when two coordinates have different x and y values" do
      let ("coordinate_1") { Rover::Coordinate.new(1,1)}
      let ("coordinate_2") { Rover::Coordinate.new(2,2)}
      it "should not be ==" do
        expect(coordinate_1 == coordinate_2).to be == false
      end
    end
    context "when two coordinates have different x and the same y values" do
      let ("coordinate_1") { Rover::Coordinate.new(1,2)}
      let ("coordinate_2") { Rover::Coordinate.new(2,2)}
      it "should not be ==" do
        expect(coordinate_1 == coordinate_2).to be == false
      end
    end
    context "when two coordinates have the same x and different y values" do
      let ("coordinate_1") { Rover::Coordinate.new(2,1)}
      let ("coordinate_2") { Rover::Coordinate.new(2,2)}
      it "should not be ==" do
        expect(coordinate_1 == coordinate_2).to be == false
      end
    end
    context "when two coordinates have the same x and y values" do
      let ("coordinate_1") { Rover::Coordinate.new(2,2)}
      let ("coordinate_2") { Rover::Coordinate.new(2,2)}
      it "should not be ==" do
        expect(coordinate_1 == coordinate_2).to be == true
      end
    end
  end
end
