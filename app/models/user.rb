class User < ActiveRecord::Base
  include SimplestAuth::Model

  authenticate_by :name

  attr_accessible :name, :email, :password

  validates :name, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true, :allow_blank => true
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates_confirmation_of :password, :if => :password_required?

  has_many :timings

  def best_times
    timings.select('trail_id, MIN(seconds) AS min').
      group('trail_id').order('min')

  end
end
