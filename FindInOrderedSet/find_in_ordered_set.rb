class FindInOrderedSet
  def self.element_exists_in_set(set, element)
    return self.binary_search(set, element)
  end

  def self.binary_search(array, element, from: 0, to: nil)
    to = array.length - 1 if to.nil?
    midpoint = (from + to) / 2
    # Impossibility, return out
    return false if to < from || from > to
    # Midpoint is too large, search left
    if array[midpoint] > element
      return self.binary_search(array, element, from: 0, to: midpoint-1)
    # Midpoint is too small, search right
    elsif array[midpoint] < element
      return self.binary_search(array, element, from: midpoint+1, to: to)
    else
      # We found the element return true
      return true
    end
  end
end

puts FindInOrderedSet.element_exists_in_set([2,3,7,1,6,7,3,5,3,10,13].sort, 13) # true
puts FindInOrderedSet.element_exists_in_set([2,3,7,1,6,7,3,5,3,10,13].sort, 14) # false
puts FindInOrderedSet.element_exists_in_set([2,3,7,1,6,7,3,5,3,10,13].sort, -30) # false