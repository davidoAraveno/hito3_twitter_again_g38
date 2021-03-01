class UsersController < ApplicationController
  def index
  end

  def new
    # ////////imagen del costado en el registro de usuarios////////////////////
    @images = Image.all.shuffle.take(1)
    
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to i_tweets_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :email, :password)
  end

end
