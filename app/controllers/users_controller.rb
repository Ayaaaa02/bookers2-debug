class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books =Book.all
    @book =Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
     @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user), notice: "You have updated user successfully."
    else
      render "show"
    end
  end

  private
  
   def ensure_correct_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
   end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end