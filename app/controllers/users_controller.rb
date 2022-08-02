class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice_useredit]="You have updated user successfully." 
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  
  private
def user_params
  params.require(:user).permit(:name,:profile_image,:introduction)
end

end