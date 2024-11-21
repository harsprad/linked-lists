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
      until link.next_node == nil do
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

  def contains?(value)
    link = @head
    until link == nil do
      return true if link.value == value
      link = link.next_node
    end
    false
  end

  def find(value)
    index = 0
    link = @head
    until link == nil do
      return index if link.value == value
      link = link.next_node
      index += 1
    end
    nil
  end

  def to_s
    return "nil" if @head == nil

    connector_string = " ) -> ( "
    out_string = "( " + @head.value.to_s
    link = @head.next_node
    until link == nil do
      out_string.concat(connector_string, link.value.to_s)
      link = link.next_node
    end
    out_string.concat(" ) -> nil")
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return append(value) if index >= size()

    insertion = Node.new(value, at(index))
    at(index - 1).next_node = insertion
  end

  def remove_at(index)
    return pop() if index >= size() - 1

    if index == 0
      @head = @head.next_node
    else
      at(index - 1).next_node = at(index + 1)
    end
  end

end
