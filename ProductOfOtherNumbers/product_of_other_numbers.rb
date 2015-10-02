#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/product-of-other-numbers
#
# Data Structure:
#
# [1, 7, 3, 4] -> [84, 12, 28, 21]
#
# By doing [7*3*4, 1*3*4, 1*7*4, 1*7*3]

class ProductOfOtherNumbers
  def self.get_products_of_all_ints_except_at_index(array)
    products_of_ints_at_index = [1] * array.length
    product_so_far = 1
    array.each_with_index do |value, i|
      products_of_ints_at_index[i] = product_so_far
      product_so_far *= value
    end
    final_index = array.length - 1
    product_so_far = 1
    final_index.downto(0) do |i|
      products_of_ints_at_index[i] *= product_so_far
      product_so_far *= array.at(i)
    end
    products_of_ints_at_index
   end
end

if __FILE__ == $0
  simple_example = [1, 7, 3, 4]
  puts "Simple situation: " + simple_example.to_s
  puts "Expected answer: [84, 12, 28, 21], got " + ProductOfOtherNumbers.get_products_of_all_ints_except_at_index(simple_example).to_s
  puts "====================\n"
  zeroes_example = [1, 0, 3, 4]
  puts "Zeros situation: " + zeroes_example.to_s
  puts "Expected answer: [0, 12, 0, 0], got " + ProductOfOtherNumbers.get_products_of_all_ints_except_at_index(zeroes_example).to_s
  puts "====================\n"
  another_example = [1, 2, 6, 5, 9]
  puts "Another situation: " + another_example.to_s
  puts "Expected answer: [540, 270, 90, 108, 60], got " + ProductOfOtherNumbers.get_products_of_all_ints_except_at_index(another_example).to_s
end

