#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/coin

class Coin
  @@memorized_change_possibility_calls = {}

  def self.number_of_ways_to_make_change_bottom_up(amount, denominations)
    ways_of_doing_n_cents = []
    ways_of_doing_n_cents[0] = 1
    denominations.each do |denomination|
      denomination.upto(amount + 1) do |higher_amount|
        higher_amount_remainder = higher_amount - denomination
        ways_of_doing_n_cents[higher_amount] = 0 if ways_of_doing_n_cents[higher_amount].nil?
        ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
      end
    end
    return ways_of_doing_n_cents[amount]
  end

  def self.number_of_ways_to_make_change(amount, denominations)
    ways_to_make_change = 0
    remaining_change = amount
    denominations.each_with_index do |denomination, index|
      1.upto(amount/denomination) do
        ways_to_make_change += self.change_possibilities(remaining_change, denominations[index+1..-1])
      end
    end
    ways_to_make_change
  end

  def self.change_possibilities(amount_left, denominations_left)
    memoize_key = amount_left.to_s + ":" + denominations_left.to_s
    return @@memorized_change_possibility_calls[memoize_key] if @@memorized_change_possibility_calls[memoize_key]
    return 1 if amount_left == 0
    return 0 if amount_left < 0
    return 0 if denominations_left.empty?
    current_denomination, rest_of_denominations = denominations_left.first, denominations_left[1..-1]
    number_of_possibilities = 0
    while amount_left >= 0
      number_of_possibilities += self.change_possibilities(amount_left, rest_of_denominations)
      amount_left -= current_denomination
    end
    @@memorized_change_possibility_calls[memoize_key] = number_of_possibilities
    number_of_possibilities
  end
end

if __FILE__ == $0
  amount = 4
  denominations = [1,2,3]
  puts "Simple situation: Amount: $#{amount}, Denominations: #{denominations.to_s}"
  simple_solution = Coin.number_of_ways_to_make_change(amount, denominations)
  puts "Expected solution: 4. Solution is: #{simple_solution.to_s}"
  puts "=================="

  puts "Simple bottom up situation: Amount: $#{amount}, Denominations: #{denominations.to_s}"
  simple_solution = Coin.number_of_ways_to_make_change_bottom_up(amount, denominations)
  puts "Expected solution: 4. Solution is: #{simple_solution.to_s}"
  puts "=================="
end
