#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/stock-price
#
# Data Structure:
#
# [500, 100, 2000]
#
#  Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
class StockPrice
  # Performance is O(1) and O(n).
  def self.best_profit(stock_prices_yesterday)
    # We must have at least 2 elements in the stock array
    return nil if stock_prices_yesterday.length < 2
    lowest_stock_price = stock_prices_yesterday.first
    max_profit = stock_prices_yesterday[1] - stock_prices_yesterday.first
    stock_prices_yesterday.each_with_index do |stock_price, minutes_past|
      next if minutes_past == 0
      potential_profit = stock_price - lowest_stock_price
      max_profit = [potential_profit, max_profit].max
      lowest_stock_price = [stock_price, lowest_stock_price].min
    end
    max_profit
  end
end

if __FILE__ == $0
  puts "Simple situation: " + [500, 0, 500, 100, 1000, 100, 5, 20000].to_s
  puts "=================="
  best_profit = StockPrice.best_profit([500, 0, 500, 100, 1000, 100, 5, 20000])
  puts "Expected Profit: $#{20000 - 0}. Best profit is: $#{best_profit}"

  puts "\nEarly rise situation: " + [500, 5000000, 500, 100, 1000, 100, 5, 20000].to_s
  puts "====================="
  best_profit = StockPrice.best_profit([500, 5000000, 500, 100, 1000, 100, 5, 20000])
  puts "Expected Profit: $#{5000000 - 500}. Best profit is: $#{best_profit}"

  puts "\nDown market situation: " + [5000000, 500, 100, 10, 3, 1].to_s
  puts "=========================="
  best_profit = StockPrice.best_profit([5000000, 500, 100, 10, 3, 1])
  puts "Expected Profit: $#{1 - 3}. Best profit is: $#{best_profit}"
end
