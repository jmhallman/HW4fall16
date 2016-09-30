class SessionsController < ApplicationController
  
  def session_params
    params.require(:session).permit(:user_id, :email, :session_token)
  end
  
  def new
  end

  def create
=begin
    user = User.new(user_params)
    User.all.each do |i|
      if i.user_id == user.user_id
        #flash[:notice] = "Sorry, this user id is taken. Try again."
        #flag = true
        if i.email == user.email
          session[:session_token] = user.session_token
          flash[:notice] = "You are logged in as #{user.user_id}"
          redirect_to movies_path and return
        end
      end
    end
    flash[:notice] = "Invalid user-id/email combination"
    redirect_to login_path
=end
    if(User.exists? user_id: session_params['user_id'])
      user = User.find_by_user_id(session_params['user_id'])
      if(user.email == session_params['email'])
        session[:session_token] = user.session_token
        flash[:notice] = "You are logged in as #{user.user_id}"
        redirect_to movies_path
      else
        flash[:notice] = "Invalid user-id/email combination"
        @current_user = nil
        redirect_to login_path
      end
    else
      flash[:notice] = "Invalid user-id/email combination"
      @current_user = nil
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to movies_path
  end
end
