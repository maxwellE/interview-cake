class BinaryTreeNode
  def initialize(value, left: nil, right: nil)
    # if left and/or right aren't specified,
    # they get a default value of nil
    @value = value
    @left  = left
    @right = right
  end
end
