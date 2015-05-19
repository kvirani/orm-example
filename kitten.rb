class Kitten

  attr_accessor :id
  attr_accessor :name
  attr_accessor :laser_strength

  def initialize(name, laser_strength, id)
    @name = name
    @laser_strength = laser_strength.to_i
    @id = id.to_i
  end

  class << self 
    def all
      conn = establish_connection

      results = conn.exec( "SELECT * FROM kittens;" )

      kittens = []
      results.each do |record|
        kittens << Kitten.new(
          record['name'], 
          record['laser_strength'], 
          record['id']
        )
      end

      kittens
    end

    def establish_connection
      conn = PG::Connection.new(
        host: 'ec2-54-197-241-97.compute-1.amazonaws.com',
        password: '5nwKtDvZcm2XOf2A__s4J8q_EN',
        user: 'tlmebsdzoqdlis',
        dbname: 'd5ns2am3lp4r0g'
      )
    end

  end


  def save
    conn = Kitten.establish_connection
    sql = "UPDATE kittens SET name = '#{name}', laser_strength = #{laser_strength}, updated_at = '#{Time.now}' WHERE id = #{id};"
    result = conn.exec(sql)
    result.result_status == PG::PGRES_COMMAND_OK
  end

  

end