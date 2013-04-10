class Comment < ActiveRecord::Base
  attr_accessible :content, :commentor_id,
                  :link_id, :ancestor_ids, :descendant_ids

  belongs_to :commentor, class_name: "User", foreign_key: "commentor_id"
  belongs_to :link
  has_many :ancestor_relations, class_name: "Relation", foreign_key: "descendant_id"
  has_many :descendant_relations, class_name: "Relation", foreign_key: "ancestor_id"
  has_many :ancestors, through: :ancestor_relations
  has_many :descendants, through: :descendant_relations
  validates :content, :commentor_id, :link_id, presence: true

  def get_ancestors
    self.ancestors
  end

  def self.get_indent(descendant, ancestor)
    Comment.get_indent_helper(descendant, ancestor, 1)
  end

  def self.get_indent_helper(descendant, ancestor, counter)
    if descendant.parent_id == ancestor.id
      counter
    else
      Comment.get_indent_helper(Comment.find(descendant.parent_id), ancestor, counter + 1)
    end
  end
end
