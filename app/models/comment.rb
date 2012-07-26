class Comment < ActiveRecord::Base
  include Commentable
  attr_accessible :body, :commentable_id, :commentable_type

  validates :commentable, :presence => true
  validates :body, :presence => true
  validates :user, :presence => true

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  scope :newest_first, order('created_at ASC')

  def get_trail
    if commentable.is_a? Trail
      commentable
    else
      commentable.get_trail
    end
  end
end
