class User < ActiveRecord::Base
  include SimplestAuth::Model

  authenticate_by :name

  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true, :allow_blank => true
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates_confirmation_of :password, :if => :password_required?

  has_many :timings, :dependent => :destroy
  has_many :comments

  def best_times
    timings.select('trail_id, MIN(seconds) AS min').
      group('trail_id').order('trail_id ASC')
  end

  def recent_times
    timings.order('created_at DESC').limit(5)
  end
end
