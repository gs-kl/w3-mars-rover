module Rover
  class Cart
    attr_reader :coordinate, :direction, :plateau
    def initialize coordinate, direction, plateau
      @coordinate = coordinate
      @direction = direction
      @plateau = plateau
      @relative_directions = [:north, :east, :south, :west]
    end


    def run_command arg
      if arg == "M"
        move
      elsif arg == "R"
        rotate "R"
      elsif arg == "L"
        rotate "L"
      end
    end

    
    def rotate relative_direction
      if relative_direction == "R"
        @direction = @relative_directions[(@relative_directions.index(@direction) + 1) % 4]
      elsif relative_direction == "L"
        @direction = @relative_directions[(@relative_directions.index(@direction) + 3) % 4]
      end
    end

    def move
      if direction == :east && (@plateau.valid_coordinate? @coordinate.east)
        @coordinate = @coordinate.east
        true
      elsif direction == :west && (@plateau.valid_coordinate? @coordinate.west)
        @coordinate = @coordinate.west
        true
      elsif (direction == :north) && (@plateau.valid_coordinate? @coordinate.north)
        @coordinate = @coordinate.north
        true
      elsif direction == :south && (@plateau.valid_coordinate? @coordinate.south)
        @coordinate = @coordinate.south
        true
      else
        false
      end
    end
  end
end
