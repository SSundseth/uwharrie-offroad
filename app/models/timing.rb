class Timing < ActiveRecord::Base
  attr_accessible :seconds, :trail_id, :user_id

  belongs_to :user
  belongs_to :trail
end
