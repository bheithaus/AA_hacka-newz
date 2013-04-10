class LinkVotesController < ApplicationController
  before_filter :allowed_to_vote

  def up
    vote = LinkVote.new(user_id: current_user.id, link_id: params[:link_id], amount: 1)
    if vote.save
      flash[:success] = "You upvoted"
    else
      flash[:error] = "You have already voted on that link"
    end
    redirect_to root_path
  end

  private

    def allowed_to_vote
      unless current_user.karma > 1
        flash[:error] = "You need higher karma"
        redirect_to root_path
      end
    end
end