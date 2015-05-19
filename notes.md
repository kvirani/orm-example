
Mapping Relational Data to OOP

Tables (kittens) => class Kitten
Rows => instance of Kitten
Cols => attributes (attr_accessor)

Dependencies - why?

Lock them in for the project b/c the code you write uses certain methods and APIs to these libraries (classes, modules, etc) for that specific version of the dependencies


ORM - Object Relational Mapping

Gives us a limited but OOP style way of interacting with our SQL database without having to write SQL when doing the data manipulation. 

The ORM library itself has generic SQL statements in methods to be able to execute CRUD operations against specific tables (one for each class)

