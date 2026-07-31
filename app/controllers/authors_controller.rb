class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    authors = Author.all

    render json: {
      success: true,
      total_authors: authors.count,
      data: authors
    }, status: :ok
  end

  # GET /authors/:id
  def show
    render json: {
      success: true,
      data: @author
    }, status: :ok
  end

  # POST /authors
  def create
    author = Author.new(author_params)

    if author.save
      render json: {
        success: true,
        message: "Author created successfully.",
        data: author
      }, status: :created
    else
      render json: {
        success: false,
        errors: author.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /authors/:id
def update
  if @author.update(author_params)
    render json: {
      success: true,
      message: "Author updated successfully.",
      data: @author
    }, status: :ok
  else
    render json: {
      success: false,
      errors: @author.errors.full_messages
    }, status: :unprocessable_entity
  end
end

  # DELETE /authors/:id
  def destroy
    @author.destroy

    render json: {
      success: true,
      message: "Author deleted successfully."
    }, status: :ok
  end

  private

  def set_author
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      success: false,
      error: "Author not found."
    }, status: :not_found
  end

  def author_params
    params.require(:author).permit(
      :name,
      :email,
      :phone,
      :bio,
      :country,
      :date_of_birth,
      :active
    )
  end
end
