class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    books = Book.all
    render json: books, status: :ok
  end

  # GET /books/:id
  def show
    render json: @book, status: :ok
  end

  # POST /books
  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /books/:id
  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    render json: { message: "Book deleted successfully" }, status: :ok
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def book_params
    params.require(:book).permit(
      :title,
      :price,
      :published_year,
      :author_id
    )
  end
end