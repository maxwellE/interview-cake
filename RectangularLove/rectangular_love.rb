#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/python/rectangular-love

class RectangularLove
  def self.love_intersection(rectangle_a, rectangle_b)
    rectangle_a_point_range = self.generate_point_range(rectangle_a)
  end

  def self.generate_point_range(rectangle)

  end
end

if __FILE__ == $0
  rectangle_a = {
      # coordinates of bottom-left corner:
      x: 1,
      y: 3,
      # width and height
      width: 6,
      height: 4,
  }

  rectangle_b = {
      # coordinates of bottom-left corner:
      x: 2,
      y: 1,
      # width and height
      width: 3,
      height: 4,
  }
  puts "Simple situation"
  simple_solution = RectangularLove.love_intersection(rectangle_a, rectangle_b)
  puts "Expected solution: {x:2, y:3,}. Solution is: #{simple_solution.to_s}"
  puts "=================="
end
