class BooksController < ApplicationController
  before_action :find_book , only: %i[ show edit update destroy ]


  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def new
    @book = current_user.books.build
    @category = Category.all.map{ |c| [c.name,c.id]}
  end

  def create
    @book = current_user.books.build(book_params)
    @book.category_id = params[:category_id]
      if @book.save
        redirect_to books_path
      else
        flash[:notice] = "Enter unique ISBN number!"
        render 'new'
      end
  end

  def edit
    @category = Category.all.map{ |c| [c.name,c.id]}
  end

  def update
    @book.category_id = params[:category_id]
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :category_id, :book_image, :ISBN_number)
  end
end
