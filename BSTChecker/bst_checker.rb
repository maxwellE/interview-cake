class BstChecker
  def self.is_balanced?(tree_node)
    self.is_left_node_balanced?(tree_node.left, tree_node.left.try(:value), tree_node.value) \
    && self.is_right_node_balanced?(tree.right, tree_node.value, tree_node.right.try(:value))
  end

  def self.is_left_node_balanced?(node, lower_bound, upper_bound)
    return true if node.nil?
    return false if node.value > lower_bound
    return self.is_left_node_balanced?(node.left, node.value, upper_bound) && self.is_right_node_balanced?(node.right, node.value, upper_bound)
  end

  def self.is_right_node_balanced?(node, lower_bound, upper_bound)
    return true if node.nil?
    return false if node.value > upper_bound
    return self.is_left_node_balanced?(node.left, lower_bound, node.value) && self.is_right_node_balanced?(node.right, lower_bound, node.value)
  end
end

