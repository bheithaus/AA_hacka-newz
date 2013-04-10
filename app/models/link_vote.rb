class LinkVote < ActiveRecord::Base
  attr_accessible :amount, :link_id, :user_id

  belongs_to :link
  belongs_to :user

  validates :link_id, :uniqueness => { scope: :user_id }
end
