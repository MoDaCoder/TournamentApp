class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # def only_see_own_page
    #     # byebug
    #     @user = User.find(params[:id])
    #     if current_user.id != current_user.match
    #       redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    #     end
    # end

    def authorize
        redirect_to new_user_session_path, alert: 'WHOA THERE BUDDY... Dont make me call Flatiron Police o_O' if current_user.nil?
    end

    def home
        @user = current_user ? current_user.email.split("@")[0]:nil
        # @user = current_user ? current_user.read_attribute(attribute_name)
    end
end
