# Delete all the things
Trail.destroy_all
User.destroy_all
Timing.destroy_all
Comment.destroy_all

# Trails
Trail.create(:name => 'Daniel',          :length => '2.0 miles', :difficulty => 'Very Hard')
Trail.create(:name => 'Wolfden',         :length => '0.9 miles', :difficulty => 'Very Easy')
Trail.create(:name => 'Dutch John',      :length => '2.1 miles', :difficulty => 'Moderate')
Trail.create(:name => 'Slab Pile',       :length => '0.9 miles', :difficulty => 'Easy')
Trail.create(:name => 'Rocky Mnt. Loop', :length => '2.8 miles', :difficulty => 'Hard')
Trail.create(:name => 'Saw Mill',        :length => '1.6 miles', :difficulty => 'Moderate')
Trail.create(:name => 'Falls Dam',       :length => '2.7 miles', :difficulty => 'Easy')
Trail.create(:name => 'Dickey Bell',     :length => '2.9 miles', :difficulty => 'Moderate')

# Locations
Trail.all.each do |trail|
  case trail.name
  when "Daniel"
    trail.locations.create(:latitude => 35.414096, :longitude => -80.022783)
    trail.locations.create(:latitude => 35.423714, :longitude => -80.045185)
  when "Wolfden"
    trail.locations.create(:latitude => 35.421301, :longitude => -80.068445)
    trail.locations.create(:latitude => 35.411543, :longitude => -80.071535)
  when "Dutch John"
    trail.locations.create(:latitude => 35.416684, :longitude => -80.058103)
    trail.locations.create(:latitude => 35.412557, :longitude => -80.070419)
  when "Slab Pile"
    trail.locations.create(:latitude => 35.417349, :longitude => -80.055099)
    trail.locations.create(:latitude => 35.418888, :longitude => -80.066900)
  when "Falls Dam"
    trail.locations.create(:latitude => 35.416579, :longitude => -80.068231)
    trail.locations.create(:latitude => 35.398146, :longitude => -80.061579)
  when "Saw Mill"
    trail.locations.create(:latitude => 35.422315, :longitude => -80.063682)
    trail.locations.create(:latitude => 35.425532, :longitude => -80.054755)
  when "Dickey Bell"
    trail.locations.create(:latitude => 35.396467, :longitude => -80.055571)
    trail.locations.create(:latitude => 35.411543, :longitude => -80.071535)
  when "Rocky Mnt. Loop"
    trail.locations.create(:latitude => 35.423714, :longitude => -80.045185)
    trail.locations.create(:latitude => 35.411543, :longitude => -80.071535)
    trail.locations.create(:latitude => 35.417349, :longitude => -80.055099)
    trail.locations.create(:latitude => 35.425532, :longitude => -80.054755)
  else puts "wrong trail name"
  end
end

# Users
User.create(:name => 'Stef',   :email => 'stefan.sundseth@viget.com', :password => 'password')
User.create(:name => 'Rob',    :email => 'robsemail@email.com',       :password => 'password')
User.create(:name => 'Andrew', :email => 'andrewsemail@email.com',    :password => 'password')
