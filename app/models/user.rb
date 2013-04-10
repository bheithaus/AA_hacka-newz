class User < ActiveRecord::Base
  attr_accessible :name, :password, :remember_token

  has_many :links, foreign_key: :author_id
  has_many :comments,  foreign_key: :commentor_id
  has_many :link_votes

  validates :name, :password, presence: true

  def karma
    self.links.joins(:link_votes).sum('amount')
  end

  def average
    self.links.joins(:link_votes).sum(:amount)/self.links.count.to_f
  end
end
