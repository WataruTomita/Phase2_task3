class BookCommentsController < ApplicationController

  before_action :ensure_correct_comment, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    # 1行に省略
    # comment = current_user.book_comments.new(book_comment_params)
    # 2行に分けて書くパターン↓
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    # ↑ここまで
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
      BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_comment
    @book_comment = BookComment.find(params[:id])
    unless @book_comment.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end
end
