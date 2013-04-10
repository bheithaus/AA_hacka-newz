
ActiveRecord::Base.transaction do
  april = User.create!(name: "april")
  link1 = april.links.create!(url: "aprilgoldman.com")
  brian = User.create!(name: "brian")
  link2 = brian.links.create!(url: "www.sweattothis.com")
  comment1 = april.comments.create!(content: "Bad Ass!", link_id: link2.id )
  vote1 = april.link_votes.create(link_id: link2.id, amount: 1)
  vote2 = brian.link_votes.create(link_id: link2.id, amount: 1)
  ned = User.create!(name: "ned")
  comment2 = ned.comments.create!(content: "Needs more cats", link_id: link2.id)
  comment3 = brian.comments.create!(content: "Will do!", link_id: link2.id,
                                    ancestor_ids: [comment2.id])
  comment4 = april.comments.create(content: "Can't wait for cats", link_id: link2.id,
                                    ancestor_ids: [comment2.id, comment3.id])
end