require_relative 'lib/linkedlist'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list

list.insert_at("VELOCIRAPTOR", 3)

puts list

list.insert_at("mouse", 0)
list.insert_at("cow", 8)

puts list

list.remove_at(9)
list.remove_at(2)
list.remove_at(0)

puts list
