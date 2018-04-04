require_relative( '../db/sql_runner' )


class Cat

attr_reader :id
attr_accessor :owner_id, :name, :age, :gender, :description, :color, :admission_date, :adoptable

######  INITIALIZE #######

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
  @gender = options['gender']
  @color = options['color']
  @description = options['description']
  @admission_date = Date.parse(options['admission_date'])
  @adoptable = options['adoptable']
  @owner_id = options['owner_id'].to_i
end

########################
  ## *** CRUD *** ##
########################

### CREATE ###

def save()
    sql = "INSERT INTO cats
    (
      name,
      age,
      gender,
      color,
      description,
      admission_date,
      adoptable,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @age, @gender, @color, @description, @admission_date, @adoptable, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  ###  READ  ###
  def self.all()
    sql = "SELECT * FROM cats"
    cats_hashes = SqlRunner.run(sql)
    cats_objects = cats_hashes.map{|cat| Cat.new(cat)}
    return cats_objects
  end

  ### UPDATE ###
  def update()
    sql = "UPDATE cats
    SET (
      name,
      age,
      gender,
      color,
      description,
      admission_date,
      adoptable,
      owner_id
    )
    =
    ($1, $2, $3, $4, $5, $6, $7, $8)
    WHERE id = $9"
    values = [@name, @age, @gender, @color, @description, @admission_date, @adoptable, @owner_id, @id]
    SqlRunner.run( sql, values )
  end

  ### DELETE ###
  def delete()
    sql = "DELETE FROM cats WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM cats"
    SqlRunner.run( sql )
  end

######### INSTANCE METHODS ###############


def owner
  owner = Owner.find(@owner_id)
  return owner
end

######### CLASS METHODS  ##################
def self.find(id)
  sql = "SELECT * FROM cats WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  cat = Cat.new(result)
  return cat
end



end
