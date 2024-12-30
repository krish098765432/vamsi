class FriendshipsController < ApplicationController
    before_action :authenticate_user!
  
    def send_request
      friend = User.find_by(email: params[:friend_email])
      if friend && friend != current_user
        current_user.send_friend_request(friend)
        redirect_to root_path, notice: 'Friend request sent!'
      else
        redirect_to root_path, alert: 'Invalid friend email or you cannot send a request to yourself.'
      end
    end
  
    def accept_request
      friend = User.find(params[:friend_id])
      current_user.accept_friend_request(friend)
      redirect_to root_path, notice: 'Friend request accepted!'
    end
  
    def reject_request
      friend = User.find(params[:friend_id])
      current_user.reject_friend_request(friend)
      redirect_to root_path, notice: 'Friend request rejected.'
    end
  end
  