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
# #delete_record

module ClassModule
    
    
  # Public: #find
  # Pulls a record from a table by it's ID.
  #
  # Parameters (will update with OPTIONS HASH):
  # id    - id number of the record wanted.
  # table - table of desire field
  #             
  # Returns:
  # Desired Record, as an array of hashes. With the "delete_secondary_kvpairs"
  # it now returns an array of hashes with desired key value pairs. No intgers
  # as the keys.
  #
  # This method is a WIP, works...needs to be cleaned up.
  def find(options)
    table = options["table"]
    id = options["id"]
    array = DATABASE.execute("SELECT * FROM #{table} WHERE id = #{id}")
    delete_secondary_kvpairs(array, :placeholder)
  end
  
  
  # TODO - Need to find a way to take it out of the array. "array[0], is not
  # working"
  # Public: #show_all
  # Shows all fields and records in the table.
  #
  # Parameters (will update with OPTIONS HASH):
  # table - table of desire field
  #             
  # Returns:
  # Desired table fields and records, as an array of hashes. With the "delete_secondary_kvpairs" it now returns an array of hashes with desired key value pairs. No intgers as the keys.
  #
  # This method is a WIP, works...needs to be cleaned up.
  # Not sure why when I put "array[0]", it only shows the first temperament.
  def show_all(options)
    table = options["table"]
    array = DATABASE.execute("SELECT * FROM #{table}")
    delete_secondary_kvpairs(array, :placeholder)
  end

  
  # Public: #delete_record
  # Permanently deletes a record from a table.
  #
  # Parameters:
  # table - Name of table you want the record deleted from.
  # id    - Id of the record you want deleted.
  #             
  # Returns:
  # Empty array
  #
  # This method DOES work.
  def delete_record(options)
    table = options["table"]
    id = options["id"]
    DATABASE.execute("DELETE FROM #{table} WHERE id = #{id}")
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
  
  
  ###== Methods Below this line are methods to help refactor other methods ==###
  
  
  # Public: #delete_secondary_kvpairs
  # Gets rid of the safeguard key-value pairs that SQLite auto includes where
  # the key is an integer 
  #
  # Parameters:
  # array       - Name of array on which method is being run
  # placeholder - Placeholder text for loop             
  #
  # Returns:
  # The updated array (minus gratuitous key-value pairs)
  #
  # This works. NOTE: You need to make the placeholder a symbol when using
  # in other methods. :)
  def delete_secondary_kvpairs(array, placeholder)    
    array.each do |placeholder|
      placeholder.delete_if do |key, value|
        key.is_a?(Integer)
      end
    end
    return array
  end

  

end