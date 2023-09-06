class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
     @books =@user.books
    @book =Book.new
  end

  def index
     @users =User.all
     @user = current_user
     @book = Book.new
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
     @user =User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user), notice: "successfully updated user!"
    else
      render "edit"
    end
  end
  
  # フォロー一覧
def follows
  user = User.find(params[:id])
  @users = user.following_users
end

# フォロワー一覧
def followers
  user = User.find(params[:id])
  @user = user.follower_users
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