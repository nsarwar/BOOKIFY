class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    books_path
    books_path2
  end
end
