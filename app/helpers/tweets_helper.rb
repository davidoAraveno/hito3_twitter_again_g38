module TweetsHelper

    def sesion
        session[:user_id].present?
    end
end
