require_relative( '../db/sql_runner' )


class Cat

attr_reader :id

attr_accessor :owner_id, :name, :age, :gender, :description, :color, :admission_date, :status

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
  @gender = options['gender']
  @color = options['color']
  @description = options['description']
  @admission_date = options['admission_date']
  @status = options['status']
  @owner_id = options['owner_id'].to_i

end

def save()
    sql = "INSERT INTO cats
    (
      name,
      age,
      gender,
      color,
      description,
      admission_date,
      status,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @age, @gender, @color, @description, @admission_date, @status, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.delete_all()
    sql = "DELETE FROM cats"
    SqlRunner.run( sql )
  end




end
