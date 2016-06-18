class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def show
   @user = User.find(params[:id])
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
 
  def edit
  end
  
  def update
   if @user.update(user_params)
      flash[:success] = "Update Complete!"
      redirect_to root_path
   eles
    render 'edit'
   end
   
  private
  
   def correct_user
     @user = User.find(params[:id])
     redirect_to root_path if @user != correct_user

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end