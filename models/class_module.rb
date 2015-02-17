# Module: ClassModule
#
# Toolbox for use the Findo project; can be used with dog_class.rb, 
# owner_class.rb, and temperament_class.rb
#
# Public Methods:
# #termainate 
# #insert - will make
# #save - will make

module ClassModule
    
  # Public: #terminate
  # Permanently deletes a table
  #
  # Parameters:
  # table - name of table to be deleted
  #             
  # Returns:
  # Nil
  def terminate(table)
    DATABASE.execute("DROP TABLE #{table}")
  end
  
end