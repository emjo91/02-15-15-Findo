require 'minitest/autorun'
require 'sqlite3'
require 'pry'
require_relative "../models/dog_class.rb"
require_relative "../models/temperament_class.rb"
require_relative "../models/owner_class.rb"
require_relative "../models/class_module.rb"

DATABASE = SQLite3::Database.new("test_findo_database.db")

DATABASE.execute("DROP TABLE 'dogs'")
DATABASE.execute("DROP TABLE 'owners'")
DATABASE.execute("DROP TABLE 'temperaments'")


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

class FindoTest < Minitest::Test

  def test_create_dog
    d = Dog.new({"name"=>"Phoebe", "breed"=>"Heeler x", "age"=>3, "serial_num"=>101311, 
                 "colour"=>"Black tri", "description"=>"Fearful of people.", "temperament_id"=>13, "owner_id"=>1})
    x = d.insert
    assert_kind_of(Integer, x)
  end

  def test_create_owner
    o = Owner.new({"name"=>"Emily Johnson", "secondary_owner"=>"Beth Johnson", "phone_num"=>4024997222, 
                   "email"=>"3mle33@gmail.com", "address"=>"4048 N 81st Ave Cir", "city"=>"Omaha", "state"=>"NE", "zip"=>68134})
    x = o.insert
    assert_kind_of(Integer, x)
  end

  def test_create_temperament
    t = Temperament.new({"temperament"=>"Hardy"})
    x = t.insert
    assert_kind_of(Integer, x)
  end
  
  def test_delete_dog
    d = Dog.new({"name"=>"Phoebe", "breed"=>"Heeler x", "age"=>3, "serial_num"=>999, 
         "colour"=>"Black tri", "description"=>"Fearful of people.", "temperament_id"=>13, "owner_id"=>1})
    x = d.insert
    array = Dog.delete_record({"table"=>"dogs", "id"=>1})
    assert_equal(0, array.length)
  end
  
  # This method isn't working yet.
  def test_find_id_by_serial_num
    d = Dog.new({"name"=>"Phoebe", "breed"=>"Heeler x", "age"=>3, "serial_num"=>3, 
                 "colour"=>"Black tri", "description"=>"Fearful of people.", "temperament_id"=>13, "owner_id"=>1})
    x = Dog.find_id_by_serial_num({"serial_num"=>3})
    assert_kind_of(Integer, x)
  end  

end