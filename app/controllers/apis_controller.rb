class ApisController < ApplicationController

   # ///////////////////////////API/////////////////////////////////
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    render json: @tweets.to_json
  end

# /////////////////////BUSCADOR DE TWEETS POR RANGO DE FECHA PARA LA API//////////////////////////
  def search
    @tweets = Tweet.all.order(created_at: :desc)
    if params[:fecha1] && params[:fecha2]
      @rango = []
      @tweets.each do |i|
        if i.created_at >= params[:fecha1] && i.created_at <= params[:fecha2]
          @rango.push(i)
        end
      end
      render json: @rango.to_json
    else
      render json: @tweets.to_json
    end
  end

  private

end