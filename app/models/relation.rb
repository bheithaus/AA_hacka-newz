class Relation < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendant_id

  belongs_to :ancestor, class_name: "Comment"
  belongs_to :descendant, class_name: "Comment"
end
