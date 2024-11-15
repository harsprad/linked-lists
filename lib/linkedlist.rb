require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end
  attr_reader :head

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      link = @head
      until link.next_node == nil
        link = link.next_node
      end
      link.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def size
    return 0 if @head == nil

    i = 1
    link = head
    until link.next_node == nil do
      i += 1
      link = link.next_node
    end
    i
  end

  def tail
    return nil if @head == nil
    link = @head
    until link.next_node == nil do
      link = link.next_node
    end
    link
  end

  def at(index)
    return nil if @head == nil

    link = @head
    (1..index).each do
      return nil if link == nil
      link = link.next_node
    end
    return link
  end

  def pop
    at(size() - 2).next_node = nil
  end

end
