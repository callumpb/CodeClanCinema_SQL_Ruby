require_relative("../db/sql_runner")
require_relative("film.rb")
require_relative("customer.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def save
    sql  = "INSERT INTO tickets (customer_id, film_id)
    VALUES ( $1, $2 )
    RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run( sql, values ).first
    @id = ticket['id'].to_i
  end

  # def update
  #   sql = "UPDATE tickets
  #   SET (customer_id, film_id)
  #   = ($1, $2)
  #   WHERE id = $3"
  #   values = [@customer_id, @film_id, @id]
  #   customer = SqlRunner.run( sql, values )
  #   @id = customer['id'].to_i
  # end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def film
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    results = SqlRunner.run(sql, values)
    return Film.new(results[0])
  end

  def customer
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results[0])
  end


end
