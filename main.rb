require 'sinatra'
require 'pry'
require 'sqlite3'
require 'pony'
# DATABASE = SQLite3::Database.new("findo_database.db")
require_relative 'models/dog_class.rb'
require_relative 'models/owner_class.rb'
require_relative 'models/temperament_class.rb'
require_relative 'models/class_module'
require_relative 'models/database_setup.rb'
require_relative 'helpers/helper.rb'

DATABASE.results_as_hash = true

helpers FindoHelper

# controllers
require_relative 'controllers/check_pet_info.rb'
require_relative 'controllers/found_pet.rb'
require_relative 'controllers/new_user_setup.rb'
require_relative 'controllers/new_dog.rb'
require_relative 'controllers/edit_pet_info.rb'
require_relative 'controllers/edit_owner_info.rb'
require_relative 'controllers/delete_pet_info.rb'
require_relative 'controllers/add_edit_temperament.rb'
require_relative 'controllers/main_pages.rb'
require_relative 'controllers/verify_dog_owner.rb'


# views
