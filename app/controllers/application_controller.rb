class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def logged_in_account
      unless account_signed_in?
        flash[:notice] = 'ログインしてください'
        redirect_to  home_index_path
      end
    end
end
