# Project: Linked list in Ruby for The Odin Project
# Author: Luján Fernaud
# Url: http://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists

require 'pry'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node.value
      @tail = node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head.value
      @head = node
    end
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
