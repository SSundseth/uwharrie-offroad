class Trail < ActiveRecord::Base
  attr_accessible :difficulty, :length, :name

  validates :name, :presence => true
  validates :length, :presence => true
  validates :difficulty, :presence => true
end
