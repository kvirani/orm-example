class Kitten

  attr_accessor :id
  attr_accessor :name
  attr_accessor :laser_strength

  def initialize(name, laser_strength, id)
    @name = name
    @laser_strength = laser_strength.to_i
    @id = id.to_i
  end

  def save
    conn = PG::Connection.new(
      host: 'ec2-54-197-241-97.compute-1.amazonaws.com',
      password: '5nwKtDvZcm2XOf2A__s4J8q_EN',
      user: 'tlmebsdzoqdlis',
      dbname: 'd5ns2am3lp4r0g'
    )
    sql = "UPDATE kittens SET name = '#{name}', laser_strength = #{laser_strength}, updated_at = '#{Time.now}' WHERE id = #{id}"
    result = conn.exec(sql)
    result.result_status == PG::PGRES_COMMAND_OK
  end

end