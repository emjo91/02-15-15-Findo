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
# None yet. 
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
  
end