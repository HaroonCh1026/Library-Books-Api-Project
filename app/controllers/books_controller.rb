class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    books = Book.includes(:author)

    # Filter by genre
    books = books.where(genre: params[:genre]) if params[:genre].present?

    # Search by title
    books = books.where("title ILIKE ?", "%#{params[:search]}%") if params[:search].present?

    # Sort by price
    books = books.order(price: :asc) if params[:sort] == "price"

    # Show latest books
    books = books.order(created_at: :desc) if params[:latest] == "true"

    render json: {
      success: true,
      total_books: books.count,
      data: books
    }, status: :ok
  end

  # GET /books/:id
  def show
    render json: {
      success: true,
      data: @book
    }, status: :ok
  end

  # POST /books
  def create
    book = Book.new(book_params)

    if book.save
      render json: {
        success: true,
        message: "Book created successfully.",
        data: book
      }, status: :created
    else
      render json: {
        success: false,
        errors: book.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /books/:id
  def update
    if @book.update(book_params)
      render json: {
        success: true,
        message: "Book updated successfully.",
        data: @book
      }, status: :ok
    else
      render json: {
        success: false,
        errors: @book.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy

    render json: {
      success: true,
      message: "Book deleted successfully."
    }, status: :ok
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      success: false,
      error: "Book not found."
    }, status: :not_found
  end

  def book_params
    params.require(:book).permit(
      :title,
      :description,
      :isbn,
      :genre,
      :language,
      :pages,
      :price,
      :published_year,
      :stock,
      :available,
      :author_id
    )
  end
end
