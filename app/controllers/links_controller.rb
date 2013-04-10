class LinksController < ApplicationController
  before_filter :logged_in_user, except: [:index]

  def index
    if params[:user_id]
      @links = User.find(params[:user_id]).links
    else
      @links = Link.best_order
    end
  end

  def new
    @link = Link.new
    @link.comments.build
  end

  def create
    @link = Link.new(params[:link])
    @link.author_id = current_user.id
    if @link.save
      flash[:success] = "You have added #{@link.title} to Hacka News"
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def logged_in_user
      redirect_to new_session_url unless logged_in?
    end
end
