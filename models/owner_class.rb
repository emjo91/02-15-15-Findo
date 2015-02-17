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
# 
class Owner
  
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
    
end