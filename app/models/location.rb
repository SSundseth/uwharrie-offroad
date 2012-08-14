class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude

  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :trail, :presence => true

  belongs_to :trail

end
