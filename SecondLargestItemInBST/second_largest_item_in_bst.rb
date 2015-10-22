require "pry"

class SecondLargestItemInBST
  def self.find_largest_item(tree_root)
     current_node = tree_root
     while current_node.present?
       return current_node.value if current_node.right.nil?
       current_node = current_node.right
     end
  end

  def self.find_second_largest_item(tree_root)
    current_node = tree_root
    while current_node
      if current_node.right.nil? && current_node.left
        return self.find_largest_item(current_node.left)
      end

      if current_node.right && current_node.left.try(:left).nil? && current_node.right.try(:right).nil?
        return current_node.value
      end

      current_node = current_node.right
    end
  end
end