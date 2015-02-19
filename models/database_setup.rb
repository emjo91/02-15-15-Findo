require 'sqlite3'

DATABASE = SQLite3::Database.new("findo_database.db")

DATABASE.execute("CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT NOT NULL, 
                  breed TEXT NOT NULL, age INTEGER, serial_num INTEGER UNIQUE, description TEXT, colour TEXT, 
                  owner_id INTEGER, temperament_id INTEGER, FOREIGN KEY (owner_id) REFERENCES owners(id), 
                  FOREIGN KEY (temperament_id) REFERENCES temperaments(id))")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS owners(id INTEGER PRIMARY KEY, name TEXT NOT NULL, 
                  secondary_owner TEXT, phone_num INTEGER NOT NULL, email TEXT, address TEXT, 
                  state TEXT, city TEXT, zip INTEGER)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS temperaments(id INTEGER PRIMARY KEY, 
                  temperament TEXT NOT NULL)")

DATABASE.results_as_hash = true


### ======================================================================== ###


# TODO

# NOTES:
# owner_id and temperament_id are the foreign keys in the table.
# serial_num MUST be unique.
# temperaments and dogs are a JOIN table.

# not sure if this will piss things off.
# SELECT dogs.serial_num, dogs.name, dogs.breed, dogs.age, dogs.colour, dogs.description, dogs.owner_id, owners.id, owners.name AS owner, ownwers.phone_num AS phone, owners.email
# FROM dogs
# JOIN owners
# ON dogs.owner_id = owners.id
# WHERE serial_num = serial_num;
#
# SELECT owners.email FROM dogs JOIN owners ON dogs.owner_id = owners.id WHERE serial_num = 101311;