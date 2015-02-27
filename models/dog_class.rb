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
# #insert
# #update 
# #update_owner_id
# #update_temperament_id
# find_by_serial_num
# show_all_breeds
# find_id_by_serial_num
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
  
  
  # Public: #update
  # Allows a person to update a dog entry.
  # MUST know the dog's serial number (as they do not know the id number, more
  # than likely.) SERIAL NUMBER CANNOT CHANGE!
  #
  # Parameters: TODO option's hash.
  # serial_num
  # name
  # breed
  # age
  # colour
  # description           
  #
  # Returns:
  # Empty Array
  #
  # State changes:
  # NA?
  #
  # This method DOES work.
  # Edited this method so that it also updated the id, owner_id, and temperament_id.
  def self.update(options)
    @serial_num = options["serial_num"] #finds the dog's record.
    @name = options["name"]
    @breed = options["breed"]
    @age = options["age"]
    @colour = options["colour"]
    @description = options["description"]
    DATABASE.execute("UPDATE dogs SET id = #{@id}, name = '#{@name}', breed = '#{@breed}', age = #{@age}, colour = '#{@colour}',
                      description = '#{@description}' WHERE serial_num = #{@serial_num}") 
  end
  
  
  # Public: #find_by_id
  # Allows a search by a phone number for the user's information.
  #
  # Parameters:
  # No Parameters               
  #
  # Returns:
  # Returns a Dog object, with owner's info.
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  # This could probably be moved into a module at some point...but for now here it is.
  def self.find_by_id(id)
    result = DATABASE.execute("SELECT * FROM dogs WHERE id = #{id}")[0]
    self.new(result) 
  end
  
  
  # Public: #update_owner_id
  # Allows a person to update an owner's ID
  #
  # Parameters: TODO option's hash.
  # owner_id
  # id
  # Returns:
  # Empty Array
  #
  # State changes:
  # NA?
  #
  # This method DOES work.
  def self.update_owner_id(options)
    @owner_id = options["owner_id"]
    @id = options["id"]
    DATABASE.execute("UPDATE dogs SET owner_id = #{@owner_id} WHERE id = #{@id}")
  end    
  
  
  # Public: #update_temperament_id
  # Allows a person to update an owner's ID
  #
  # Parameters: TODO option's hash.
  # temperament_id
  # id
  #
  # Returns:
  # Empty Array
  #
  # State changes:
  # NA?
  #
  # This method DOES work.
  def self.update_temperament_id(options)
    @temperament_id = options["temperament_id"]
    @id = options["id"]
    DATABASE.execute("UPDATE dogs SET temperament_id = #{@temperament_id} WHERE id = #{@id}")
  end  
  
  
  # Public: #find_by_serial_num
  # Pulls a record from a table by it's serial number.
  #
  # Parameters (will update with OPTIONS HASH):
  # serial_num - serial number of the record wanted.
  #             
  # Returns:
  # This returns an object.
  #
  # Working. 
  def self.find_by_serial_num(options)
    serial_num = options["serial_num"]
    result = DATABASE.execute("SELECT name, breed, age, colour, description, serial_num, id, owner_id, 
                              temperament_id FROM dogs WHERE serial_num = #{serial_num}")[0]
    self.new(result)
  end
  
  
  # Public: #find_by_serial_num_iterate
  # Pulls a record from a table by it's serial number.
  #
  # Parameters (will update with OPTIONS HASH):
  # serial_num - serial number of the record wanted.
  #             
  # Returns:
  # This returns an Array of Hashes
  #
  # Working. 
  def self.find_by_serial_num_iterate(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT name, breed, age, colour, description FROM dogs WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
  end
  
  
  # TODO - need to find a way to take it out of the array.
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
  end
  
  
  # Public: #self.find_id_by_serial_num
  # Grabs the record id based off of a serial number given by the user.
  #
  # Parameters:
  # serial_num              
  #
  # Returns:
  # An Integer, specifially the record id.
  #
  # State changes:
  # NA?
  #
  # This method IS working. DONE.
  # THIS IS WORKING!
  # Maybe refactor this if possible? It's getting a bit long...
  # Seems to be working...not sure why it wasn't just one time...
  def self.find_id_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT id FROM dogs WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0].each do |x, id|
      @id = id
    end
    return @id 
  end
  
  
  # Public: #self.find_owner_id_by_serial_num
  # Grabs the record owner_id based off of a serial number given by the user.
  #
  # Parameters:
  # serial_num              
  #
  # Returns:
  # An Integer, specifially the record id.
  #
  # State changes:
  # NA?
  #
  # THIS IS WORKING!
  # Maybe refactor this if possible? It's getting a bit long...
  # Seems to be working...not sure why it wasn't just one time...
  def self.find_owner_id_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT owner_id FROM dogs WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0].each do |x, id|
      @id = id
    end
    return @id 
  end
  
  
  # Public: #self.find_temperament_id_by_serial_num
  # Grabs the record owner_id based off of a serial number given by the user.
  #
  # Parameters:
  # serial_num              
  #
  # Returns:
  # An Integer, specifially the record id.
  #
  # State changes:
  # NA?
  #
  # THIS IS WORKING!
  # Maybe refactor this if possible? It's getting a bit long...
  # Seems to be working...not sure why it wasn't just one time...
  def self.find_temperament_id_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT temperament_id FROM dogs WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0].each do |x, id|
      @id = id
    end
    return @id 
  end
    
end #class end