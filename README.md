# Mars Rover Explorers

A squad of robotic rovers are to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points.
The plateau is divided up into a grid to simplify navigation.
An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters.
The possible letters are ‘L’, ‘R’ and ‘M’.
‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

#### Gems

It only comes with the 'rspec' gem for testing. It also comes with files that
set the ruby version and the gemset. Once you pull down this project once, and
bundle gems, you shouldn't have to do it again. Your computer should just know
which Ruby and gemset to use.

## Getting Started

1. `bundle` to get your gems
2. Follow the tests, follow specs in this order
    1. coordinate_spec.rb
    2. plateau_spec.rb

## Stretch
Follow or write specs to build Cart and Operator
