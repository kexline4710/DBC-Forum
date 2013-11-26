class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  # include ActionController::Caching
  # self.page_cache_directory = Rails.public_path
  protect_from_forgery with: :exception
end
