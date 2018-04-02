require_relative( '../db/sql_runner' )


class Owner

  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @background = options['background']
    @accommodation_type = options['accommodation_type']
    @total_existing_cats = options['total_existing_cats'].to_i
  end

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

    def self.delete_all()
      sql = "DELETE FROM cats"
      SqlRunner.run( sql )
    end





end
