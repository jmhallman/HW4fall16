class User < ActiveRecord::Base
    def self.create_user!(userHash)
        session_token_param = SecureRandom.base64
        #userHash = {:user_id => @user.user_id, :email => @user.email, :session_token => session_token_param}
        userHash[:session_token] = session_token_param
        User.create!(userHash)
        #heroku pg:psql
        #/d
        #select * from users;
    end
end
