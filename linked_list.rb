require 'pry'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head  = nil
    @tail  = nil
    @nodes = 0
  end

  def append(node)
    @nodes += 1

    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end

    @tail = node
  end

  def prepend(node)
    @nodes += 1

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    @nodes
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value     = value
    @next_node = nil
  end
end

list = LinkedList.new
list.append(Node.new(1))
list.append(Node.new(2))
list.append(Node.new(3))
list.prepend(Node.new(0))

p list.head
p list.tail
p list.size
