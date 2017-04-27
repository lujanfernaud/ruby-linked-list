require 'pry'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    @size += 1

    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end

    @tail = node
  end

  def prepend(node)
    @size += 1

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def at(index)
    indexed_list = {}
    node = @head

    return if index >= @size

    @size.times do |idx|
      indexed_list[idx] = node
      node = node.next_node
    end

    indexed_list[index]
  end

  def pop
    old_tail = @tail
    new_tail = at(@size - 2)

    return if new_tail.nil?
    new_tail.next_node = nil

    @tail  = new_tail
    @size -= 1

    old_tail
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
list.append(Node.new(9))
list.at(4)

p list.head
p list.tail

p list.size
p list.tail
p list.pop

p list.size
p list.tail
p list.pop
