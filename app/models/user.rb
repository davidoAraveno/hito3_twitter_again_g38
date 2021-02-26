class User < ApplicationRecord
    has_secure_password

    has_many :user_friends, :class_name => 'Friend', :foreign_key => 'friend_id'
    has_many :friends
    
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :photo, presence: true, format: {with: URI::regexp(%w(http https))}
    
    has_many :tweets
    has_many :likes    
    
end
