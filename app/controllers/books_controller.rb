class BooksController < ApplicationController

  def index

    @books = Book.page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
    @page_title = @book.name
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編輯成功˙ㄥ˙"
      redirect_to book_path(@book)
    else
      render :action => :edit
    end
  end





private
  def book_params
    params.require(:book).permit(:name, :description)
  end


end
