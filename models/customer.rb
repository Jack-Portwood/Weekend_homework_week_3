
  require_relative('../db/sql_runner')

  class Customer

    attr_accessor :id, :name, :funds

  def initialize(db_hash)#options is the hash
    @id = db_hash['id'].to_i if db_hash['id']
    @name = db_hash['name']
    @funds = db_hash['funds'].to_f

  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING *"
    values =[@name,@funds]
    customer = SqlRunner.run(sql, values)
    @id = customer.first['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM customers"
    customer_data =SqlRunner.run(sql)  #customer_data = array of hashes
    customers = customer_data.map{|geezer| Customer.new(geezer)}
    return customers
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql= "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id =$1"
    values =[@id]
    result = SqlRunner.run(sql,values)
  end

  def films_booked()
    sql = "SELECT * FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    films_data = SqlRunner.run(sql,values)
    result = films_data.map{|film| Film.new(film)}
    return result
  end

  # def remaining_funds()
  #   sql = "SELECT * FROM custoemrs
  #         INNER JOIN tickets ON customers.id = tickets.customer_id
  #         WHERE tickets.customer_id =$1"
  #         values [@id]
  #         result = Sqlrunner.run(sql,values)
  #         results.each{|row| @price -=row["price"].to_i}
  #         return @price
  #       end

end
