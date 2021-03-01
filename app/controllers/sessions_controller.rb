class SessionsController < ApplicationController
  http_basic_authenticate_with name:'david', password:'123', only: :images

  def index
    @images = Image.all.shuffle.take(6)
  end

  def new
    @user = User.new
    @images = Image.all.shuffle.take(1)
  end

  def create
    # ////////////guardar imagenes para usar en aplicacion/////////////
    if params[:image].present?
      @image = Image.new(image_params)

      if @image.save
        redirect_to images_path, notice: 'imagen guardada con exito'
      else
        redirect_to images_path, notice: "error al intentar guardar"
      end
      # ////////////////////crear nueva sesion de usuario//////////////////
    elsif params[:user].present?
      @user = User.find_by_email(params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to i_tweets_path
      else
        flash[:alert] = "Usuario y contraseña no encontrados"
        redirect_to s_new_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def images
    # /////////////vista para guardar imagenes para usar en la aplicacion///////////////////////
    @image = Image.new
    @images = Image.all
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end

end
