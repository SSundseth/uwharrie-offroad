# Delete all the things
Trail.destroy_all
User.destroy_all
Timing.destroy_all

# Trails
Trail.create(:name => 'Daniel',          :length => '2.0 miles', :difficulty => 'Very Hard')
Trail.create(:name => 'Wolfden',         :length => '1.3 miles', :difficulty => 'Very Easy')
Trail.create(:name => 'Dutch John',      :length => '2.1 miles', :difficulty => 'Moderate')
Trail.create(:name => 'Slab Pile',       :length => '1.2 miles', :difficulty => 'Easy')
Trail.create(:name => 'Rocky Mnt. Loop', :length => '2.8 miles', :difficulty => 'Hard')
Trail.create(:name => 'Saw Mill',        :length => '1.6 miles', :difficulty => 'Moderate')
Trail.create(:name => 'Falls Dam',       :length => '2.8 miles', :difficulty => 'Easy')
Trail.create(:name => 'Dickey Bell',     :length => '3.5 miles', :difficulty => 'Moderate')


# Users
User.create(:name => 'Stef',   :email => 'stefan.sundseth@viget.com', :password => 'password')
User.create(:name => 'Rob',    :email => 'robsemail@email.com',       :password => 'password')
User.create(:name => 'Andrew', :email => 'andrewsemail@email.com',    :password => 'password')

# Put user ids in an array
ids = User.all(:select => :id).collect(&:id)

# Times
5.times do |t|
  Trail.all.each do |trail|
    trail.timings.create(:user_id => ids.shuffle.first, :seconds => (rand(7000) + 3600))
  end
end
