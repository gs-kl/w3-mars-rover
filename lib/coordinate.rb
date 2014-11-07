module Rover
  class Coordinate
    attr_accessor :x, :y

    def initialize x, y
      @x = x
      @y = y
    end

    def valid?
      (@x >= 0) && (@y >= 0)
    end

    def east
      Coordinate.new(@x+1, @y)
    end

    def west
      Coordinate.new(@x-1, @y)
    end

    def north
      Coordinate.new(@x, @y+1)
    end

    def south
      Coordinate.new(@x, @y-1)
    end

    def == other
      (self.x == other.x) && (self.y == other.y)
    end
  end
end
