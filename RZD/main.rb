require_relative "company"
require_relative "instance_counter"
require_relative "station"
require_relative "train"
require_relative "train_cargo"
require_relative "train_passenger"
require_relative "route"
require_relative "wagon"
require_relative "wagon_passenger"
require_relative "wagon_cargo"
require_relative "rzd"

r = Rzd.new
r.add_station("Moscow")
r.add_station("St. Peterburg")
r.add_station("Kurgan")
r.add_station("Tumen")
r.add_train("p1", 'Passenger', 4)
r.add_train("p2", 'Passenger', 2)
r.add_train("c1", "Cargo", 4)
r.add_train("c2", "Cargo", 2)
r.add_route(Station.all[0], Station.all[1])
r.add_route(Station.all[0], Station.all[2])
r.add_route(Station.all[3], Station.all[2])
r.start_menu