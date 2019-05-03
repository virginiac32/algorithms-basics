# Iterative solution DFS

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# In order traversal (Left -> Root -> Right) of binary tree
# Using a stack, if there's still a child to the left, keep going left. If no more left, grab the right child by picking up the next one in the stack
# Binary search tree - each node has max 2 children. Left subtree has nodes that are less than parent node, right subtree has nodes that are more than parent node. All subtrees are also BSTs. 
#   it's a BST if in-order traversal of it is sorted 

def iterative_inorder_traversal(root)
    return nil if !root
    traversal = []
    
    stack = []
    node = root
    while !stack.empty? || node
        if node
            stack.push(node)
            node = node.left
        else
            node = stack.pop
            traversal.push(node.val)
            node = node.right
        end
    end

    print('inorder ', traversal, "\n")
end

def iterative_preorder_traversal(root)
    return nil if !root
    traversal = []
    
    stack = [root]
    node = root
    while !stack.empty?
        node = stack.pop
        traversal.push(node.val)
        if node.right
            stack.push(node.right)
        end
        if node.left
            stack.push(node.left)
        end
    end

    print('preorder ', traversal, "\n")
end

def iterative_postorder_traversal(root)
    return nil if !root
    traversal = []
    stack = []
    node = root

    while !stack.empty? || node
        while node
            if node.right
                stack.push(node.right)
            end
            stack.push(node)
            node = node.left
        end

        node = stack.pop
        if node.right && stack[-1] == node.right
            stack.pop
            stack.push(node)
            node = node.right
        else
            traversal.push(node.val)
            node = nil
        end
    end

    print('postorder ', traversal, "\n")
end

root = TreeNode.new(1)
second = TreeNode.new(2)
third = TreeNode.new(3)
fourth = TreeNode.new(4)
fifth = TreeNode.new(5)
sixth = TreeNode.new(6)
root.left = second
root.right = third
second.right = fourth
third.left = fifth

iterative_inorder_traversal(root)
iterative_preorder_traversal(root)
iterative_postorder_traversal(root)





