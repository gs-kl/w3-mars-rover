module Rover
  class Operator
    attr_reader :cart, :plateau, :coordinate
    def initialize code
      @plateau = Rover::Plateau.new
      placerover code
      @cart = Rover::Cart.new(@coordinate, @direction, @plateau)
    end

    def placerover code
      x = code[0].to_i
      y = code[1].to_i
      direction = if code[2] == "N"
                       :north
                     elsif code[2] == "S"
                       :south
                     elsif code[2] == "W"
                       :west
                     elsif code[2] == "E"
                       :east
                     end
      @coordinate = Rover::Coordinate.new(x, y)
      @direction = direction
    end

    def reset code
      placerover code
    end

    def run_command commands
      commands.scan(/\w/).each do |a|
        @cart.run_command a
      end
    end
  end
end
