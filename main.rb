require 'pg'
require_relative 'kitten'

puts "CURRENTLY:"
kittens = Kitten.all
puts kittens.inspect

# k = kittens.first
# k.name = 'Charlie' # make change in memory
# puts k.save.inspect # this doesn't exist yet, so we need to implement it!

# puts Kitten.all.inspect

puts "Creating new kitten!"
k = Kitten.new("Muggles 2.0", 5)
k.save # => INSERT 
k.name = 'Krum 2.0'
k.save

k = Kitten.find_by_id(5)
k.owner # => #<Owner>
o = Owner.new('Khurram')
k.owner = o 
k.save


# Kitten API SPEC

# Kitten.all # SELECT => []
# kitten.save # UPDATE
# k = Kitten.find_by_id(id)
# k.destroy # => DELETE 

# k2 = Kitten.new(...) # What about ID here? DB sets this
# k2.name = 'fdsafsa'
# k2.save # => INSERT 






