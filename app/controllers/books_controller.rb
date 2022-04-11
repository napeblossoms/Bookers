class BooksController < ApplicationController

  def index #一覧、投稿画面が同じ
    @books = Book.all
    @book = Book.new
  end

  def create #保存機能
   @book = Book.new(book_params)
    #if @book.save
     # flash[:notice] = 'メッセ―ジが送信されました'
      #redirect_to book_path(@book.id)
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = 'Book was successfully created.'
       redirect_to "/books/#{book.id}"
    else
     @book = book
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end