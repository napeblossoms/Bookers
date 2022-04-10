class BooksController < ApplicationController

  def index #一覧、投稿画面が同じ
    @books = Book.all
    @book = Book.new
  end

  def create #保存機能
    book = Book.new(book_params)
    book.save
    redirect_to "/books/#{book.id}"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}"
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end