require 'pg'
require_relative 'kitten'

conn = PG::Connection.new(
  host: 'ec2-54-197-241-97.compute-1.amazonaws.com',
  password: '5nwKtDvZcm2XOf2A__s4J8q_EN',
  user: 'tlmebsdzoqdlis',
  dbname: 'd5ns2am3lp4r0g'
)

results = conn.exec( "SELECT * FROM kittens;" )

kittens = []
results.each do |record|
  kittens << Kitten.new(
    record['name'], 
    record['laser_strength'], 
    record['id']
  )
end

puts kittens.inspect

k = kittens.first
k.name = 'Ralfy' # make change in memory
puts k.save.inspect # this doesn't exist yet, so we need to implement it!





