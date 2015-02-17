# Module: ClassModule
#
# Toolbox for use the Findo project; can be used with dog_class.rb, 
# owner_class.rb, and temperament_class.rb
#
# Public Methods:
# #termainate 
# #insert - DONE, working.
# #save - will make
# #find - WIP
# #find_by_serial_num

module ClassModule
    
    
  # TODO
  # Public: #find
  # Pulls a record from a table by it's ID.
  #
  # Parameters (will update with OPTIONS HASH):
  # id    - id number of the record wanted.
  # table - table of desire field
  #             
  # Returns:
  # Desired Record, as an array of hashes
  #
  # This method is a WIP, works...needs to be cleaned up.
  def find(options)
    table = options["table"]
    id = options["id"]
    DATABASE.execute("SELECT * FROM #{table} WHERE id = #{id}")      
  end
  
  
  # TODO
  # Public: #find_by_serial_num
  # Pulls a record from a table by it's serial number.
  #
  # Parameters (will update with OPTIONS HASH):
  # serial_num - serial number of the record wanted.
  # table      - table of desire field
  #             
  # Returns:
  # Desired Record, which is a an array of hashes.
  #
  # This method is a WIP, works...needs to be cleaned up.
  def find_by_serial_num(options)
    table = options["table"]
    serial_num = options["serial_num"]
    DATABASE.execute("SELECT * FROM #{table} WHERE serial_num = #{serial_num}")      
  end

  
  # TODO
  # No code yet.
  def serial_num_pull_owner_name_phone_num
    # I need to make a method that pulls a serial number the dog's table, then pulls corresponding info from owner info. Only name and phone number.
  end

  
  # Public: #terminate
  # Permanently deletes a table
  #
  # Parameters:
  # table - name of table to be deleted
  #             
  # Returns:
  # Nil
  #
  # This method DOES work.
  def terminate(table)
    DATABASE.execute("DROP TABLE #{table}")
  end

end