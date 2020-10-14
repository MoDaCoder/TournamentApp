class ApplicationController < ActionController::Base

    def home
        @user = current_user ? current_user.email.split("@")[0]:nil
    end
end
