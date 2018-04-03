require_relative( '../db/sql_runner' )


class Owner

  attr_reader :id
  attr_accessor :name, :age, :background, :accommodation_type, :total_existing_cats

  ####  INITIALIZE #######

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @background = options['background']
    @accommodation_type = options['accommodation_type']
    @total_existing_cats = options['total_existing_cats'].to_i
  end

  ########################
  ## *** CRUD *** ##
  ########################

  ### CREATE ###

  def save()
    sql = "INSERT INTO owners
    (
      name,
      age,
      background,
      accommodation_type,
      total_existing_cats
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @age, @background, @accommodation_type, @total_existing_cats]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  ###  READ  ###
  def self.all()
    sql = "SELECT * FROM owners"
    owners_hashes = SqlRunner.run(sql)
    owners_objects = owners_hashes.map{|owner| Owner.new(owner)}
    return owners_objects
  end

  ### UPDATE ###
  def update()
    sql = "UPDATE owners
    SET (
      name,
      age,
      background,
      accommodation_type,
      total_existing_cats
    )
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @age, @background, @accommodation_type, @total_existing_cats, @id]
    SqlRunner.run( sql, values )
  end

  ### DELETE ###
  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  ########### INSTANCE METHODS ##################

  def cat()
    cat = Cat.find(@id)
    return cat

    # sql = "SELECT * FROM cats
    # WHERE owner_id = $1"
    # values = [@id]
    # cat_hashes = SqlRunner.run(sql, values)
    # cat_objects = cat_hashes.map { |cat_hash| Cat.new(cat_hash) }
    # return cat_objects
  end



  ######### CLASS METHODS  ##################
  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner
  end


end
