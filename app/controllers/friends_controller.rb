class FriendsController < ApplicationController

    def create
        @friendship = Friend.new(friend_params)
        @friendship.save
        redirect_to i_tweets_path
    end

    def destroy
        @friendship = Friend.find_by(
            user_id: params[:friend][:user_id], 
            friend_id: params[:friend][:friend_id])

            if @friendship.present?
                @friendship.destroy
                redirect_to i_tweets_path
            end
    end

    private

    def friend_params
        params.require(:friend).permit(:user_id, :friend_id)
    end

end