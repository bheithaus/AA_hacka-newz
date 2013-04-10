class Link < ActiveRecord::Base
  attr_accessible :url, :author_id, :title

  has_many :comments
  has_many :link_votes
  belongs_to :author, class_name: "User"

  validates :title, :url, :author_id, presence: true

  def self.best_order
    Link.joins('LEFT OUTER JOIN link_votes ON links.id = link_votes.link_id')
        .group("link_id")
        .order("sum(link_votes.amount) DESC")
    ###this only shows links with votes in the last 24 hours, we want it
    # to show all links, but only count the votes in the last 24 hours!
  end

  def number_of_comments
    self.comments.count
  end

  def vote_sum
    self.link_votes.sum('amount')
  end
end
