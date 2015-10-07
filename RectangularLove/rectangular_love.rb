#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/python/rectangular-love

class RectangularLove
  def self.love_intersection(rectangle_a, rectangle_b)
    # bottom left points
    rectangle_a_bottom_left_point = [rectangle_a[:x], rectangle_a[:y]]
    rectangle_b_bottom_left_point = [rectangle_b[:x], rectangle_b[:y]]

    # top left points
    rectangle_a_top_left_point = [rectangle_a[:x], rectangle_a[:y] + rectangle_a[:height]]
    rectangle_b_top_left_point = [rectangle_b[:x], rectangle_b[:y] + rectangle_b[:height]]

    # top right points
    rectangle_a_top_right_point = [rectangle_a[:x] + rectangle_a[:width], rectangle_a[:y] + rectangle_a[:height]]
    rectangle_b_top_right_point = [rectangle_b[:x] + rectangle_b[:width], rectangle_b[:y] + rectangle_b[:height]]

    # bottom right points
    rectangle_a_bottom_right_point = [rectangle_a[:x] + rectangle_a[:width], rectangle_a[:y]]
    rectangle_b_bottom_right_point = [rectangle_b[:x] + rectangle_b[:width], rectangle_b[:y]]

    # go through each point of a rectangle and compare to the points in b rectangle,
    # save any overlaps then compute the final rectangle from the overlap points

    # lets start with A rectangle
    top_left_a_point_intersects = self.point_intersects_other_points?(rectangle_a_top_left_point, rectangle_b_top_left_point, rectangle_b_top_right_point, rectangle_b_bottom_left_point, rectangle_b_bottom_right_point)
    if top_left_a_point_intersects
      return {}
    end
    top_right_a_point_intersects = self.point_intersects_other_points?(rectangle_a_top_right_point, rectangle_b_top_left_point, rectangle_b_top_right_point, rectangle_b_bottom_left_point, rectangle_b_bottom_right_point)
    if top_right_a_point_intersects
      return construct_rectangle_for_top_right_point_intersect(rectangle_b_bottom_left_point, rectangle_a_bottom_left_point, rectangle_a_top_right_point)
    end
    bottom_right_a_point_intersects = self.point_intersects_other_points?(rectangle_a_bottom_right_point, rectangle_b_top_left_point, rectangle_b_top_right_point, rectangle_b_bottom_left_point, rectangle_b_bottom_right_point)
    bottom_left_a_point_intersects = self.point_intersects_other_points?(rectangle_a_bottom_left_point, rectangle_b_top_left_point, rectangle_b_top_right_point, rectangle_b_bottom_left_point, rectangle_b_bottom_right_point)
    # now B rectangle
    top_left_b_point_intersects = self.point_intersects_other_points?(rectangle_a_top_left_point, rectangle_a_top_left_point, rectangle_a_top_right_point, rectangle_a_bottom_left_point, rectangle_a_bottom_right_point)
    top_right_b_point_intersects = self.point_intersects_other_points?(rectangle_b_top_right_point, rectangle_a_top_left_point, rectangle_a_top_right_point, rectangle_a_bottom_left_point, rectangle_a_bottom_right_point)
    if top_right_b_point_intersects
      return construct_rectangle_for_top_right_point_intersect(rectangle_a_bottom_left_point, rectangle_b_bottom_left_point, rectangle_b_top_right_point)
    end

    # Now we know if we have an intersection or now, calculate the resulting rectangle

  end

  def self.construct_rectangle_for_top_right_point_intersect(rectangle_1_bottom_left_point, rectangle_2_bottom_left_point, rectangle_2_top_right_point)
    origin_x = [rectangle_1_bottom_left_point.first, rectangle_2_bottom_left_point.first].max
    origin_y = [rectangle_1_bottom_left_point.last, rectangle_2_bottom_left_point.last].max
    width = rectangle_2_top_right_point.first - origin_x
    height = rectangle_2_top_right_point.last - origin_y
    return { x: origin_x, y: origin_y, width: width, height: height }
  end

  def self.point_intersects_other_points?(point, top_left_point, top_right_point, bottom_left_point, bottom_right_point)
    point_falls_within_width = point.first > bottom_left_point.first && point.first < top_right_point.first
    point_falls_within_height = point.last > bottom_right_point.last && point.last < top_left_point.last
    point_falls_within_width && point_falls_within_height
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
  puts "Expected solution: {x:2, y:3, width:3, height:2}. Solution is: #{simple_solution.to_s}"
  puts "=================="

  rectangle_a = {
      # coordinates of bottom-left corner:
      x: 0,
      y: 0,
      # width and height
      width: 2,
      height: 2,
  }

  rectangle_b = {
      # coordinates of bottom-left corner:
      x: 1,
      y: 1,
      # width and height
      width: 2,
      height: 2,
  }
  puts "Small situation"
  small_solution = RectangularLove.love_intersection(rectangle_a, rectangle_b)
  puts "Expected solution: {x:1, y:1, width:1, height:1}. Solution is: #{small_solution.to_s}"
  puts "=================="
end
