class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
  
  def create
    @user = User.new(user_params)
    
    User.all.each do |i|
      if i == @user.email
        flash[:notice] = "Sorry, this user id is taken. Try again."
        redirect_to movies_path
      end
    end
    
    emailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    if emailRegex =~ @user.email
      flash[:notice] = "#{@user.user_id} was successfully created."
      @user = User.create!(user_params)
      redirect_to movies_path
    else
      flash[:notice] = "Invalid email."
      redirect_to movies_path
    end
    
    #flash[:notice] = "#{@user.user_id} was successfully created."
    #redirect_to movies_path
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
  end

  def update
  end
end
