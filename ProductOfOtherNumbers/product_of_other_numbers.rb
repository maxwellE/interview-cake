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
    # brute solution
    final_array = []
    # O(n) for this outer loop
    array.each_with_index do |value, index|
      # O(n) for this inner looping
      final_array << self.array_without_index(array, index).reduce(1, :*)
    end
    # Perf is O(n^2), we can do better!
    final_array
  end

  def self.array_without_index(array, index)
    final_array = []
    array.each_with_index { |value, i| final_array << value if i != index }
    final_array
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
end

