require('pg')

class SqlRunner

  def self.run( sql, values = [] ) #self. as it is not an instance of anything it runs itself
    begin
      db = PG.connect({ dbname: 'cinema', host: 'localhost' }) #needs to know the name of database and where its being hosted
      db.prepare("query", sql) #prepared statment helps against SQL injection
      result = db.exec_prepared("query", values) #assigning values to a variable to capture response of the query
    ensure
      db.close() if db != nil
    end
    return result #output will be an array with hashes
  end

end
