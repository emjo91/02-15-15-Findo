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


  # TODO - Need to fix hashes.
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
    DATABASE.execute("SELECT temperament FROM temperaments")
  end

end