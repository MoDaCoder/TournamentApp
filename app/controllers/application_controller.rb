class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # helper_method :current_user

    # def authorize
    #     redirect_to new_user_session_path, alert: 'WHOA THERE BUDDY... Dont make me call Flatiron Police o_O' if current_user.nil?
    # end

    def home
        @user = current_user ? current_user.email.split("@")[0]:nil
        # @user = current_user ? current_user.read_attribute(attribute_name)
    end
end
