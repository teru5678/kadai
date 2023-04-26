class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.books.new(post_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit()
end
