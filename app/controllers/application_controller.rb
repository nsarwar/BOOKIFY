class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    books_path
    second_books_path3
  end
end
