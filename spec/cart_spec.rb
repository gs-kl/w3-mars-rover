require 'spec_helper'

describe Rover::Cart do
  before do
  end

  describe 'on initialize' do
    # stretch: how could you move some of this code into a shared test setup
    # space so that there isn't so much duplication

    it "reports its coordinate" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :north
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)

      expect(cart.coordinate).to be == coordinate
    end

    it "reports its initial direction" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :north
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)

      expect(cart.direction).to be == :north
    end
  end

  describe "#rotate" do
    it "will change the direction from :north to :east when provided 'R'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :north
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('R')

      expect(cart.direction).to be == :east
    end

    it "will change the direction from :east to :south when provided 'R'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :east
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('R')

      expect(cart.direction).to be == :south
    end

    it "will change the direction from :south to :west when provided 'R'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :south
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('R')

      expect(cart.direction).to be == :west
    end

    it "will change the direction from :west to :north when provided 'R'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :west
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('R')

      expect(cart.direction).to be == :north
    end

    it "will change the direction from :north to :west when provided 'L'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :north
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('L')

      expect(cart.direction).to be == :west
    end

    it "will change the direction from :west to :south when provided 'L'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :west
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('L')

      expect(cart.direction).to be == :south
    end

    it "will change the direction from :south to :east when provided 'L'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :south
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('L')

      expect(cart.direction).to be == :east
    end

    it "will change the direction from :east to :north when provided 'L'" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :east
      plateau = Rover::Plateau.new

      cart = Rover::Cart.new(coordinate, direction, plateau)
      cart.rotate('L')

      expect(cart.direction).to be == :north
    end
  end

  describe '#move' do
    it "will have the coordinate of the eastern next coordinate when pointing east" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :east
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.move
      expect(cart.coordinate).to be == coordinate.east
    end

    it "will have the coordinate of the northern next coordinate when pointing north" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :north
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.move
      expect(cart.coordinate).to be == coordinate.north
    end

    it "will have the coordinate of the southern next coordinate when pointing south" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :south
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.move
      expect(cart.coordinate).to be == coordinate.south
    end

    it "will have the coordinate of the western next coordinate when pointing west" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :west
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.move
      expect(cart.coordinate).to be == coordinate.west
    end

    it "will return true when successful" do
      coordinate = Rover::Coordinate.new(1,2)
      direction = :west
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      expect(cart.move).to be == true
    end

    it "will stay where it is if the next coordinate is not valid according to the plateau" do
      coordinate = Rover::Coordinate.new(0,0)
      direction = :south
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.move
      expect(cart.coordinate).to be == Rover::Coordinate.new(0, 0)
    end

    it "returns false if the next coordinate is not valid according to the plateau" do
      coordinate = Rover::Coordinate.new(0,0)
      direction = :south
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      expect(cart.move).to be == false
    end
  end

  describe "#run_command" do
    it "will move when provided 'M'" do
      coordinate = Rover::Coordinate.new(5,5)
      direction = :north
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.run_command('M')
      expect(cart.coordinate).to be == coordinate.north
    end

    it "will rotate to the left when provided 'L'" do
      coordinate = Rover::Coordinate.new(5,5)
      direction = :north
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.run_command('L')
      expect(cart.direction).to be == :west
    end

    it "will rotate to the right when provided 'R'" do
      coordinate = Rover::Coordinate.new(5,5)
      direction = :north
      plateau = Rover::Plateau.new
      cart = Rover::Cart.new(coordinate, direction, plateau)

      cart.run_command('R')
      expect(cart.direction).to be == :east
    end
  end
end
