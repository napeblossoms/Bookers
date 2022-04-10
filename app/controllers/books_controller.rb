class BooksController < ApplicationController

  def index #一覧、投稿画面が同じ
    @book = Book.all
    @book = Book.new
  end

  def create #保存機能
    book = Book.new(book_params)
    book.save
    redirect_to "/"
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end