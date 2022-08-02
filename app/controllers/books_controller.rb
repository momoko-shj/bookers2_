class BooksController < ApplicationController
  
  # def new
  #   @book = Book.new
  # end
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice_create]="You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  
  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
  end

  def show
   @book = Book.find(params[:id])
   @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice_edit]="You have updated book successfully."
      redirect_to book_path(@book) 
    else
     render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
