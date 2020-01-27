require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

Customer.delete_all
Film.delete_all
Ticket.delete_all


customer1 =Customer.new({'name' => 'steve', 'funds' => 10.50})
customer1.save()

customer2 =Customer.new({'name' => 'joseph', 'funds' => 10.50})
customer2.save()

customer1.funds = 101.30
customer1.update()


film1 =Film.new({'title' => 'Platoon', 'price' => 5.43})
film1.save()

film2 =Film.new({'title' => 'The Purge', 'price' => 4.99})
film2.save()

film3 =Film.new({'title' => 'Dora the Explorer', 'price' => 100.02})
film3.save()
# film3.delete


ticket1 =Ticket.new({'customer_id' => customer1.id,'film_id' => film1.id})

ticket2 =Ticket.new({'customer_id' => customer2.id,'film_id' => film1.id})

ticket3 =Ticket.new({'customer_id' => customer1.id,'film_id' => film3.id})

ticket4 =Ticket.new({'customer_id' => customer2.id,'film_id' => film2.id})



ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

binding.pry
nil
