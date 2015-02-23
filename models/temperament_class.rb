require_relative 'class_module.rb'

# Class: Temperament
#
# Description to be added here.
#
# Attribues:
# @id           - Integer:
# @temperament  - String
#
# Public Methods:
# insert
# self.show_all_temperaments
#
class Temperament
  extend ClassModule
  
  attr_reader :id
  attr_accessor :temperament
  
  def initialize(options)
    @id = options["id"]
    @temperament = options["temperament"]
  end
  
  
  # Public: #insert
  # Allows a person to insert an object into the "temperaments" table.
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
    DATABASE.execute("INSERT INTO temperaments (temperament) VALUES ('#{@temperament}')")
    @id = DATABASE.last_insert_row_id
  end  


  # Public: #show_all_temperaments
  # Shows a person all the temperaments listed. This will go into a drop down menu for selection of temperaments.
  #
  # Parameters:
  # No Parameters               
  #
  # Returns:
  # an array of hashes of all temperaments.
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def self.show_all_temperaments
    array = DATABASE.execute("SELECT temperament FROM temperaments")
    delete_secondary_kvpairs(array, :placeholder) 
  end
  
  
  # Public: #temperament_id
  # Retrieves the ID number of the temperament.
  #
  # Parameters:
  # temperament               
  #
  # Returns:
  # The ID number of the temperament
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def self.temperament_id(options)
    temperament = options["temperament"]
    array = DATABASE.execute("SELECT id FROM temperaments WHERE temperament = '#{temperament}'")
    delete_secondary_kvpairs(array, :placeholder) 
    array[0].each do |x, id|
      @id = id
    end
    return @id 
  end
  
  
  # Public: #return_dog_temperament_by_serial_num
  # Retrieves the temperament based on a dog's serial_num
  #
  # Parameters:
  # serial_num              
  #
  # Returns:
  # An array of hashes
  #
  # State changes:
  # NA?
  #
  # This method IS working.
  def self.return_dog_temperament_by_serial_num(options)
    serial_num = options["serial_num"]
    array = DATABASE.execute("SELECT temperaments.temperament FROM temperaments JOIN dogs 
                              ON dogs.temperament_id = temperaments.id WHERE serial_num = #{serial_num}")
    delete_secondary_kvpairs(array, :placeholder)
  end

end