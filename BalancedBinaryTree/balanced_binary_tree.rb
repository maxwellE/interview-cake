require "pry"

require_relative "../Helpers/binary_tree_node"

# Question URL: https://www.interviewcake.com/question/ruby/balanced-binary-tree

class BalancedBinaryTree
  # this implementation assumes that the input is a flat array of integers
  def is_superbalanced(tree_root)
    depths = []
    nodes = []
    nodes << [tree_root, 0]
    while nodes.any?
      node, depth = nodes.pop
      if node.left.nil? && node.right.nil?
        depths << depth if !depths.include(depth)
        return false if depths.count > 2
        return false if depth.count == 2 || ((depths.first - depths.last).abs > 1)
      end
      nodes << [node.left, depth + 1] if node.left
      nodes << [node.right, depth + 1] if node.right
    end
    return false if depths.length == 1 && depths.first > 1
    true
  end
end
