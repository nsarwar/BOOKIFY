class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review , only: [:edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:show]

  def new
    @review = Review.new
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    if @review.user_id != nil
      @review.save
      redirect_to book_path(@book)
    else
      flash[:notice] = "Your commment could not be saved. Please make sure to submit valid input only!"
      render 'new'
    end

  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end

  end

  def destroy
    @review.destroy
    redirect_to book_path(@book)
  end

  private


  def review_params
    params.require(:review).permit(:rating,:comment)
  end
  def find_book
    @book = Book.find(params[:book_id])
  end


  def find_review
    @review = Review.find(params[:id])
  end
end






