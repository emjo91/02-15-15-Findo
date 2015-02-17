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
    
end