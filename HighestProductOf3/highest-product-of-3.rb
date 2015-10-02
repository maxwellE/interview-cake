#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/highest-product-of-3
#
# Given an array_of_ints, find the highest_product you can get from three of the integers.

# The array will always have 3 integers

class HighestProductOf3
  def self.highest_product(array_of_ints)
    highest_3 = array_of_ints.slice!(0, 3)
    product_so_far = highest_3.reduce(:*)
    array_of_ints.each do |value|
      highest_3.combination(2).each do |combination|
        product_array = combination << value
        new_product =  product_array.reduce(:*)
        if new_product > product_so_far
          highest_3 = product_array
          product_so_far = new_product
        end
      end
    end
    highest_3.reduce(:*)
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
