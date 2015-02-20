# These are dogs and owners to be inserted into tables.

# ex: p13 = Product.new({"serial_num"=>47003, "description"=>"Do NOT swallow these.", "quantity"=>54, "name"=>"Polly Pockets", "cost"=>1000, "location_id"=>3, "category_id"=>2})

# these are needed for creating a new dog object: name, breed, age, serial_num, colour, description, temperament_id, owner_id

# these are needed for creating a new owner object: name, secondary_owner, phone_num, address, city, state, zip

# You only need temperament for creating a new temperament object.

# array[0] does not seem to work for displaying more than one hash in an array...only for displaying one thing.



d1 = Dog.new({"name"=>"Kobayashi Maru", "breed"=>"English Shepherd", "age"=>2, "serial_num"=>190712, "colour"=>"Black tri", "description"=>"Arthritis, fearful of new people.", "temperament_id"=>24, "owner_id"=>1})
d2 = Dog.new({"name"=>"Phoebe", "breed"=>"Heeler x", "age"=>3, "serial_num"=>101311, "colour"=>"Black tri", "description"=>"Fearful of people.", "temperament_id"=>13, "owner_id"=>1})
d3 = Dog.new({"name"=>"Lexi", "breed"=>"Maltese", "age"=>13, "serial_num"=>190501, "colour"=>"White", "description"=>"Doesn not like head patted", "temperament_id"=>21, "owner_id"=>2})
d4 = Dog.new({"name"=>"Lex", "breed"=>"Australian Shepherd", "age"=>3, "serial_num"=>100511, "colour"=>"Red tri", "description"=>"Super sweet", "temperament_id"=>14, "owner_id"=>3})
d5 = Dog.new({"name"=>"Sparky", "breed"=>"Chow x", "age"=>9, "serial_num"=>763827, "colour"=>"Blonde", "description"=>"Very sweet", "temperament_id"=>23, "owner_id"=>4})
d6 = Dog.new({"name"=>"Sky", "breed"=>"Beagle", "age"=>4, "serial_num"=>118972, "colour"=>"Black tri", "description"=>"Loves people", "temperament_id"=>7, "owner_id"=>4})
d7 = Dog.new({"name"=>"Stitch", "breed"=>"Heeler x", "age"=>3, "serial_num"=>103111, "colour"=>"White with black spots", "description"=>"Kinda crazy", "temperament_id"=>25, "owner_id"=>5})
d8 = Dog.new({"name"=>"Jupiter", "breed"=>"Cavalier King Charles Spaniel", "age"=>1, "serial_num"=>223157, "colour"=>"Red and white", "description"=>"Silly little goober", "temperament_id"=>23, "owner_id"=>6})
d9 = Dog.new({"name"=>"Bruce", "breed"=>"Cocker Spaniel", "age"=>5, "serial_num"=>762911, "colour"=>"Black and tan", "description"=>"Does not like big dogs", "temperament_id"=>4, "owner_id"=>6})
d10 = Dog.new({"name"=>"Daisy Doo", "breed"=>"Lab x", "age"=>2, "serial_num"=>475621, "colour"=>"Yellow", "description"=>"Nervous with strangers", "temperament_id"=>7, "owner_id"=>7})
d11 = Dog.new({"name"=>"Candy", "breed"=>"Lab", "age"=>1, "serial_num"=>152713, "colour"=>"Yellow", "description"=>"Friendly and cute", "temperament_id"=>22, "owner_id"=>8})


o1 = Owner.new({"name"=>"Emily Johnson", "secondary_owner"=>"Beth Johnson", "phone_num"=>4024997222, "email"=>"3mle33@gmail.com", "address"=>"4048 N 81st Ave Cir", "city"=>"Omaha", "state"=>"NE", "zip"=>68134})
o2 = Owner.new({"name"=>"John Johnson", "secondary_owner"=>"Beth Johnson", "phone_num"=>4024213565, "email"=>"texthere@gmail.com", "address"=>"6100 S 41st St", "city"=>"Lincoln", "state"=>"NE", "zip"=>68516})
o3 = Owner.new({"name"=>"Damen Abbott", "secondary_owner"=>"NA", "phone_num"=>4025556748, "email"=>"texthere@gmail.com", "address"=>"74212 S Center St", "city"=>"Omaha", "state"=>"NE", "zip"=>68127})
o4 = Owner.new({"name"=>"Sandie Acker", "secondary_owner"=>"NA", "phone_num"=>4028959595, "email"=>"s.acker@gmail.com", "address"=>"4048 N 81st Ave Cir", "city"=>"Omaha", "state"=>"NE", "zip"=>68134})
o5 = Owner.new({"name"=>"Shonda Jenkins", "secondary_owner"=>"Bob Jenkins", "phone_num"=>4023334321, "email"=>"yaysayers@gmail.com", "address"=>"34212 LaFayette Cir", "city"=>"Omaha", "state"=>"NE", "zip"=>68137})
o6 = Owner.new({"name"=>"Kristina Wilkins", "secondary_owner"=>"Jim Notwilkins", "phone_num"=>4023331040, "email"=>"kwilkings@gmail.com", "address"=>"4032 N 156th Ave", "city"=>"Omaha", "state"=>"NE", "zip"=>68132})
o7 = Owner.new({"name"=>"Rayden Schulkey", "secondary_owner"=>"Jeremy Chadwell", "phone_num"=>4025557621, "email"=>"naydean@gmail.com", "address"=>"12376 Falala Drive", "city"=>"Elkhorn", "state"=>"NE", "zip"=>68715})
o8 = Owner.new({"name"=>"Brandi Atkinson", "secondary_owner"=>"NA", "phone_num"=>4024217865, "email"=>"bcandy@gmail.com", "address"=>"6523 N 81st", "city"=>"Lincoln", "state"=>"NE", "zip"=>68518})

t1 = Temperament.new({"temperament"=>"Hardy"})
t2 = Temperament.new({"temperament"=>"Lonely"})
t3 = Temperament.new({"temperament"=>"Brave"})
t4 = Temperament.new({"temperament"=>"Adamant"})
t5 = Temperament.new({"temperament"=>"Naughty"})
t6 = Temperament.new({"temperament"=>"Bold"})
t7 = Temperament.new({"temperament"=>"Docile"})
t8 = Temperament.new({"temperament"=>"Relaxed"})
t9 = Temperament.new({"temperament"=>"Impish"})
t10 = Temperament.new({"temperament"=>"Lax"})
t11 = Temperament.new({"temperament"=>"Timid"})
t12 = Temperament.new({"temperament"=>"Hasty"})
t13 = Temperament.new({"temperament"=>"Serious"})
t14 = Temperament.new({"temperament"=>"Jolly"})
t15 = Temperament.new({"temperament"=>"Naive"})
t16 = Temperament.new({"temperament"=>"Modest"})
t17 = Temperament.new({"temperament"=>"Mild"})
t18 = Temperament.new({"temperament"=>"Quiet"})
t19 = Temperament.new({"temperament"=>"Bashful"})
t20 = Temperament.new({"temperament"=>"Rash"})
t21 = Temperament.new({"temperament"=>"Calm"})
t22 = Temperament.new({"temperament"=>"Gentle"})
t23 = Temperament.new({"temperament"=>"Sassy"})
t24 = Temperament.new({"temperament"=>"Careful"})
t25 = Temperament.new({"temperament"=>"Quirky"})

What PONY looks like: 

Pony.mail(:to => '3mle33@gmail.com', :from => 'findodonotreply@gmail.com', :subject => 'hi', :body => 'Hello there.')
