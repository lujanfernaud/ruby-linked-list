require 'pry'

# Full list and its methods.
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # Adds a new node to the end of the list.
  def append(value)
    node = Node.new(value)
    @size += 1

    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end

    @tail = node
  end

  # Adds a new node to the start of the list.
  def prepend(value)
    node = Node.new(value)
    @size += 1

    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end

    @head = node
  end

  # Returns a hash with indexes as keys and nodes as values.
  def indexed_list
    indexed_list = {}
    node = @head

    @size.times do |idx|
      indexed_list[idx] = node
      node = node.next_node
    end

    indexed_list
  end

  # Returns the node at the given index.
  def at(index)
    return if index >= @size
    indexed_list[index]
  end

  # Removes and returns the last element from the list.
  def pop
    old_tail = @tail
    new_tail = at(@size - 2)

    return if new_tail.nil?
    new_tail.next_node = nil

    @tail  = new_tail
    @size -= 1

    old_tail
  end

  # Returns true if the passed in value is in the list.
  def contains?(value)
    indexed_list.any? { |_key, node| node.value == value }
  end

  # Returns the index of the node containing data, or nil if not found.
  def find(data)
    result = indexed_list.select { |i, node| return i if node.value == data }
    result.empty? ? nil : result
  end

  # Represent the LinkedList objects as strings.
  # ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    indexed_list.values.each do |node|
      print "( #{node.value} )"
      print " -> "
      print "nil\n" if node.next_node.nil?
    end
  end

  # Inserts the data at the given index.
  def insert_at(index, value)
    old_node     = at(index)
    earlier_node = at(index - 1)
    new_node     = Node.new(value)

    @size += 1
    new_node.next_node     = old_node
    earlier_node.next_node = new_node
  end

  # Removes the data at the given index.
  def remove_at(index)
    old_node     = at(index)
    earlier_node = at(index - 1)
    later_node   = at(index + 1)

    @size -= 1
    earlier_node.next_node = later_node
    old_node.next_node     = nil
  end
end

# Node structure.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value     = value
    @next_node = nil
  end
end

list = LinkedList.new
list.append(3)
list.append(5)
list.append(6)
list.prepend(1)
list.append(9)

p list.at(4) # => #<Node:0x00000000af9ce0 @value=9, @next_node=nil>

p list.head # => #<Node:0x00000002eda560 @value=1, @next_node=
                 #<Node:0x00000002eda5d8 @value=3, @next_node=
                 #<Node:0x00000002eda5b0 @value=5, @next_node=
                 #<Node:0x00000002eda588 @value=6, @next_node=
                 #<Node:0x00000002eda538 @value=9, @next_node=nil>>>>>

p list.tail # => #<Node:0x00000002eda538 @value=9, @next_node=nil>

p list.contains?(9) # => true
p list.find(9) # => 4
p list.find(10) # => nil

p list.size # => 5
p list.tail # => #<Node:0x00000001643740 @value=9, @next_node=nil>
p list.pop # => #<Node:0x00000001643740 @value=9, @next_node=nil>

p list.size # => 4
p list.tail # => #<Node:0x000000016437e0 @value=6, @next_node=nil>
p list.pop # => #<Node:0x000000016437e0 @value=6, @next_node=nil>

puts list # => ( 1 ) -> ( 3 ) -> ( 5 ) -> nil

p list.insert_at(2, 7)
puts list # => ( 1 ) -> ( 3 ) -> ( 7 ) -> ( 5 ) -> nil
p list.insert_at(1, 11)
puts list # => ( 1 ) -> ( 11 ) -> ( 3 ) -> ( 7 ) -> ( 5 ) -> nil

p list.remove_at(1)
puts list # => ( 1 ) -> ( 3 ) -> ( 7 ) -> ( 5 ) -> nil
p list.remove_at(2)
puts list # => ( 1 ) -> ( 3 ) -> ( 5 ) -> nil
