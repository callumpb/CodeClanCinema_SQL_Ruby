require_relative("../db/sql_runner")
require_relative("film.rb")
require_relative("customer.rb")

class Ticket
  @id = options['id'].to_i
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
end
