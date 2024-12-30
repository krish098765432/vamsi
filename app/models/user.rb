class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :friendships
         has_many :friends, through: :friendships
 # Adding helper methods to manage friendships
 def send_friend_request(friend)
  friendships.create(friend: friend, status: :pending)
end

def accept_friend_request(friend)
  friendship = friendships.find_by(friend: friend)
  friendship.update(status: :accepted) if friendship
end

def reject_friend_request(friend)
  friendship = friendships.find_by(friend: friend)
  friendship.update(status: :rejected) if friendship
end

# Add more validations if needed
end       
         
        