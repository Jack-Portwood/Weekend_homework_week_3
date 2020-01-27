
  require_relative('../db/sql_runner')

  class Ticket

    attr_accessor :id, :customer_id, :film_id

    def initialize(db_hash) #hash object returned from database
      @id = db_hash['id'].to_i if db_hash['id']
      @customer_id = db_hash['customer_id'].to_i
      @film_id = db_hash['film_id'].to_i

    end
    def save()
      sql = "INSERT INTO tickets (customer_id, film_id)
      VALUES ($1, $2)
      RETURNING *"
      values =[@customer_id,@film_id]
      ticket = SqlRunner.run(sql, values)
      @id = ticket.first['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM tickets ORDER BY customer_id"
      ticket_data =SqlRunner.run(sql)  #customer_data = array of hashes
      tickets = ticket_data.map{|dochet| Ticket.new(dochet)}
      return tickets
    end

    def update()
      sql = "UPDATE customers SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
      values = [@customer_id, @film_id, @id]
      SqlRunner.run(sql,values)
    end

    def delete()
      sql = "DELETE FROM ticket WHERE id =$1"
      values =[@id]
      result = SqlRunner.run(sql)
    end

    def self.delete_all()
      sql= "DELETE FROM tickets;"
      SqlRunner.run(sql)
    end


end
