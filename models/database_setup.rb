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
