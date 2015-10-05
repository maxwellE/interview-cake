#!/usr/bin/env ruby

require "pry"

# Question URL: https://www.interviewcake.com/question/merging-ranges

class ProductOfOtherNumbers
  def self.condense_meeting_times(meeting_time_ranges)
    sorted_meetings = meeting_time_ranges.sort
    start_meeting_time = sorted_meetings.first.first
    end_meeting_time = sorted_meetings.first.last
    condensed_meeting_times = []
    sorted_meetings.each_with_index do |meeting_times, index|
      next_meeting_times = sorted_meetings[index + 1]
      if next_meeting_times.nil?
        condensed_meeting_times << [start_meeting_time, end_meeting_time]
        next
      end
      if next_meeting_times.first > end_meeting_time
        condensed_meeting_times << [start_meeting_time, end_meeting_time]
        start_meeting_time = next_meeting_times.first
        end_meeting_time = [end_meeting_time, next_meeting_times.last].max
      else
        end_meeting_time = [end_meeting_time, next_meeting_times.last].max
        next
      end
    end
    condensed_meeting_times
  end
end

if __FILE__ == $0
  simple_situation = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
  puts "Simple situation: " + simple_situation.to_s
  simple_solution = ProductOfOtherNumbers.condense_meeting_times(simple_situation)
  puts "Expected solution: [[0, 1], [3, 8], [9, 12]. Solution is: #{simple_solution.to_s}"
  puts "=================="

  non_overlap_situation =  [[1, 2], [2, 3]]
  puts "Non overlap situation: " + non_overlap_situation.to_s
  non_overlap_solution = ProductOfOtherNumbers.condense_meeting_times(non_overlap_situation)
  puts "Expected solution: [[1, 2], [2, 3]]. Solution is: #{non_overlap_solution.to_s}"
  puts "=================="

  subsumed_situation = [[1, 5], [2, 3]]
  puts "Subsumed situation: " + subsumed_situation.to_s
  non_overlap_solution = ProductOfOtherNumbers.condense_meeting_times(subsumed_situation)
  puts "Expected solution: [[1, 5]]. Solution is: #{non_overlap_solution.to_s}"
  puts "=================="

  fully_compacted_situation = [[1, 10], [2, 6], [3, 5], [7, 9]]
  puts "Fulled compacted situation: " + fully_compacted_situation.to_s
  fully_compacted_solution = ProductOfOtherNumbers.condense_meeting_times(fully_compacted_situation)
  puts "Expected solution: [[1, 10]]. Solution is: #{fully_compacted_solution.to_s}"
  puts "=================="
end
