require('pry')
require_relative('models/film.rb')
require_relative('models/customer.rb')
require_relative('models/ticket.rb')

Ticket.delete_all
Film.delete_all
Customer.delete_all


customer1 = Customer.new({'name' => 'Kalina', 'funds' => '100'})
customer1.save
customer2 = Customer.new({'name' => 'Callum', 'funds' => '500'})
customer2.save

film1 = Film.new({'title' => 'Star Wars', 'price' => '10'})
film1.save
film2 = Film.new({'title' => 'Interstellar', 'price' => '15'})
film2.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save
binding.pry
nil
