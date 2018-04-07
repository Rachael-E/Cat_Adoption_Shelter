require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd3c13snbupb3vj',
      host: 'ec2-54-83-19-244.compute-1.amazonaws.com',
      port: 5432, user: 'dfwvnnumngatag', password: '8eb9ae406e0d0de525dcc4c67c4e7ab478cde589d5a7195ba4e03c4dda7c76d2'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end

### FOR RUNNING LOCALLY ###
 # db = PG.connect ({dbname: 'cat_shelter', host: 'localhost'})


### FOR RUNNING THROUGH HEROKU ###
#  ( {dbname: 'd3c13snbupb3vj',
# host: 'ec2-54-83-19-244.compute-1.amazonaws.com',
# port: 5432, user: 'dfwvnnumngatag', password: '8eb9ae406e0d0de525dcc4c67c4e7ab478cde589d5a7195ba4e03c4dda7c76d2'})
