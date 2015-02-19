require_relative 'class_module.rb'

# Class: Owner
#
# Creates owner objects.
#
# Attributes:
# @id              - Integer:
# @name            - String: Name of product
# @secondary_owner - String: Product ID, primary key for products table
# @phone_num       - Integer: Number of products in inventory
# @address         - String: Description of product (duh)
# @city            - String: Number of cents product costs
# @state           - String:
# @zip             - Integer: Unique identifier for particular product
#
# Public Methods:
# insert
# self.find_by_phone_num
# self.show_all_owners
#
class Owner
extend ClassModule
  
  
  attr_reader :id
  attr_accessor :name, :secondary_owner, :phone_num, :address, :city, :state, :zip
  
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @secondary_owner = options["secondary_owner"]
    @phone_num = options["phone_num"]
    @email = options["email"]
    @address = options["address"]
    @city = options["city"]
    @state = options["state"]
    @zip = options["zip"]
  end
  
  
  # Public: #insert
  # Allows a person to insert an object into the "owners" table.
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
    DATABASE.execute("INSERT INTO owners (name, secondary_owner, phone_num, email, address, city, state, zip) VALUES 
                    ('#{@name}', '#{@secondary_owner}', #{@phone_num}, '#{@email}','#{@address}', '#{@city}', '#{@state}', #{@zip})")
    @id = DATABASE.last_insert_row_id
  end
  
  
  # Public: #self.find_by_phone_num
  # Allows a search by a phone number for the user's information.
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
  # This method IS working.
  def self.find_by_phone_num(options)
    phone_num = options["phone_num"]
    array = DATABASE.execute("SELECT * FROM owners WHERE phone_num = #{phone_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0]
  end
  
  
  # Public: #show_all_owners
  # Shows all the names of the owners in the database.
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
  # This method IS working.
  def self.show_all_owners
    array = DATABASE.execute("SELECT name FROM owners")
    delete_secondary_kvpairs(array, :placeholder)
    array[0]
  end
  
  
  # Public: #return_email_by_serial_num
  # Pulls the owner's email by a dog's serial_num
  #
  # Parameters:
  # serial_num               
  #
  # Returns:
  # An array of hashes, with "delete_secondary_kvpairs" it gets rid of 
  # hashes with key values of integers. With "array[0]" it takes the
  # remaining hashes out of the array.
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def self.return_email_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT owners.email FROM dogs JOIN owners ON dogs.owner_id = owners.id WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0]
  end
  
  
  # Public: #return_owner_id_by_serial_num
  # Pulls the owner's id by a dog's serial_num
  #
  # Parameters:
  # serial_num               
  #
  # Returns:
  # An integer. The id number.
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def self.return_owner_id_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT owners.id FROM dogs JOIN owners ON dogs.owner_id = owners.id WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
    array[0].each do |x, id|
      @id = id
    end
    return @id 
  end
  
  
end