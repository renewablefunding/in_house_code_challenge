class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Login # see controller concerns
  helper_method :current_user
end
