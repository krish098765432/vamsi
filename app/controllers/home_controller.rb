class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @friends = current_user.friends
    @pending_requests = current_user.friendships.pending
  end

  def about
    # code for about action (if needed)
  end

  def contact
    # code for contact action (if needed)
  end

  # This action will display the home page with the user's friends

end
