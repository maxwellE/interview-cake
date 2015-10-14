require "pry"

# Question URL: https://www.interviewcake.com/question/ruby/temperature-tracker

class TemperatureTracker
  attr_accessor :max, :min, :mean, :mode, :temperature_count, :temperature_sum, :temperature_counts, :max_temperature_count

  def insert(temperature)
    self.set_new_total_temperature_count
    self.calculate_new_min(temperature)
    self.calculate_new_max(temperature)
    self.calculate_new_mean(temperature)
    self.calculate_new_mode(temperature)
    self
  end

  def set_new_total_temperature_count
    self.temperature_count = 0 if self.temperature_count.nil?
    self.temperature_count += 1
  end

  def calculate_new_min(temperature)
    if self.min.nil?
      self.min = temperature
      return
    end
    self.min = temperature if temperature < self.min
    self.min
  end

  def calculate_new_max(temperature)
    if self.max.nil?
      self.max = temperature
      return
    end
    self.max = temperature if temperature > self.max
    self.max
  end

  def calculate_new_mean(temperature)
    self.temperature_sum = 0 if self.temperature_sum.nil?
    self.temperature_sum += temperature
    self.mean = (self.temperature_sum.to_f / self.temperature_count.to_f)
  end

  def calculate_new_mode(temperature)
    self.temperature_counts = {} if self.temperature_counts.nil?
    self.temperature_counts[temperature] = 0 if self.temperature_counts[temperature].nil?
    self.max_temperature_count = 0 if self.max_temperature_count.nil?
    self.temperature_counts[temperature] += 1
    if self.temperature_counts[temperature] > self.max_temperature_count
      self.mean = temperature
      self.max_temperature_count = self.temperature_counts[temperature]
    end
  end
end
