class User < ActiveRecord::Base
    def create_user!(userHash)
        session_token_param = SecureRandom.base64
        userHash = {:user_id => @user.user_id, :email => @user.email, :session_token => session_token_param}
        @user = User.create!(user_params)
    end
end
