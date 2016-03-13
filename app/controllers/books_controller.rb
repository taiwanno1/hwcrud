class BooksController < ApplicationController

  before_action :set_book, :only => [:show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).per(5)
    @book = Book.new
  end

  def show
    @page_title = @book.name
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "編輯成功"
      redirect_to book_path(@book)
    else
      render :action => :edit
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new (book_params)

    if @book.save
      flash[:notice] = "Add new book!!!!!!!!!!!!!!!!!"
      redirect_to books_path
    else
      render :action => :new
    end
  end

  def destroy
    flash[:alert] = "dare u kill me!!!!!!!"
    @book.destroy
    redirect_to  books_path
  end



private
  def book_params
    params.require(:book).permit(:name, :description, :isbn, :publicatino_date, :date_added)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
