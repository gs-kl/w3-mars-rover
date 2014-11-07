module Rover
  class Plateau
    attr_reader :coordinates
    def initialize
      @coordinates = []
      (0..9).each do |x|
        (0..9).each do |y|
          @coordinates << Coordinate.new(x, y)
        end
      end
    end

    def include? coordinate
      if @coordinates.include? coordinate
        true
      else
        false
      end
    end

    def valid_coordinate? coordinate
      (self.include? coordinate) && (coordinate.valid?)
    end
  end
end
