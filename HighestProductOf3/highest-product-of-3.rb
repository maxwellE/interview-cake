#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/highest-product-of-3
#
# Given an array_of_ints, find the highest_product you can get from three of the integers.

# The array will always have 3 integers

class HighestProductOf3
  def self.highest_product(array_of_ints)
    first_2_elements = array_of_ints.slice!(0, 2)
    highest_product_of_2 = first_2_elements.reduce(:*)
    lowest_product_of_2 = highest_product_of_2
    highest = first_2_elements.max
    lowest = first_2_elements.min
    highest_product_of_3 = highest_product_of_2 * array_of_ints.first
    array_of_ints.each do |value|
      highest_product_of_3 = [highest_product_of_3, value * highest_product_of_2, value * lowest_product_of_2].max
      lowest_product_of_2 = [lowest_product_of_2, lowest * value, highest * value].min
      highest_product_of_2 = [highest_product_of_2, highest * value, lowest, value].max
      lowest = [lowest, value].min
      highest = [highest, value].max
    end
    highest_product_of_3
  end
end

if __FILE__ == $0
  simple_example = [1, 7, 3, 4]
  puts "Simple situation: " + simple_example.to_s
  puts "Expected answer: 84, got " + HighestProductOf3.highest_product(simple_example).to_s
  puts "====================\n"

  negative_example = [-10, -10, 1, 3, 2]
  puts "Negative situation: " + negative_example.to_s
  puts "Expected answer: 300, got " + HighestProductOf3.highest_product(negative_example).to_s
  puts "====================\n"
end
