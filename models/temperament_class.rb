# Class: Temperament
#
# Description to be added here.
#
# Attribues:
# @id           - Integer:
# @temperament  - String
#
# Public Methods:
# 
class Temperament
  
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
end