class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
  @user = User.new
  end
  
   def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
   end

  def followings
   @user = User.new(user_params)
   @followings = @user.following_users  #ﾌｫﾛｰﾜｰIDから、ﾌｫﾛｰしているﾕｰｻﾞを取得
  end

  def followers
   @user = User.new(user_params)
   @follower = @user.follower_users           #ﾌｫﾛｰﾜｰIDから、ﾌｫﾛｰされているﾕｰｻﾞを取得
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end