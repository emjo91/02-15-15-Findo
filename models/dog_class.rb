require_relative 'class_module.rb'

# Class: Dog
#
# Creates dog objects.
#
# Attributes:
# @id          - Integer:
# @name        - String: Name of product
# @breed       - String: Product ID, primary key for products table
# @age         - Integer: Number of products in inventory
# @serial_num  - Integer: Description of product (duh)
# @colour      - String: Number of cents product costs
# @description - Integer: Unique identifier for particular product
#
# Public Methods:
# insert
# self.show_all_breeds
#
class Dog
  extend ClassModule
  
  attr_reader :id, :serial_num
  attr_accessor :name, :breed, :age, :colour, :description, :temperament_id, :owner_id
  
  def initialize(options)
    @id = options ["id"]
    @name = options["name"]
    @breed = options["breed"]
    @age = options ["age"]
    @serial_num = options["serial_num"]
    @colour = options["colour"]
    @description = options["description"]
    @temperament_id = options["temperament_id"]
    @owner_id = options["owner_id"]
  end
  
  
  # Public: #insert
  # Allows a person to insert an object into the "dogs" table.
  #
  # Parameters:
  # No Parameters               
  #
  # Returns:
  # id
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def insert
    DATABASE.execute("INSERT INTO dogs (name, breed, age, serial_num, colour, description, temperament_id, owner_id) VALUES 
                    ('#{@name}', '#{@breed}', #{@age}, #{@serial_num}, '#{@colour}', '#{@description}', #{@temperament_id}, #{@owner_id})")
    @id = DATABASE.last_insert_row_id
  end
  
  
  # Public: #find_by_serial_num
  # Pulls a record from a table by it's serial number.
  #
  # Parameters (will update with OPTIONS HASH):
  # serial_num - serial number of the record wanted.
  #             
  # Returns:
  # An array of hashes, with "delete_secondary_kvpairs" it gets rid of 
  # hashes with key values of integers. With "array[0]" it takes the
  # remaining hashes out of the array.
  #
  # Working. NOTE - was working without referring to self? idk...seems
  # to need self now...idk.
  def self.find_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT * FROM dogs WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0]    
  end
  
  
  # Public: #show_all_breeds
  # Shows all the breeds in the database.
  #
  # Parameters:
  # No Parameters               
  #
  # Returns:
  # An array of hashes, with "delete_secondary_kvpairs" it gets rid of 
  # hashes with key values of integers. With "array[0]" it takes the
  # remaining hashes out of the array.
  #
  # State changes:
  # NA?
  #
  # This method IS working. DONE.
  def self.show_all_breeds
    array = DATABASE.execute("SELECT breed FROM dogs")
    delete_secondary_kvpairs(array, :placeholder)
    array[0]
  end
  
end