class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def logged_in_account
      unless account_signed_in?
        flash[:notice] = 'ログインしてください'
        redirect_to  home_index_path
      end
    end

    def logged_in_admin
      unless current_account.admin?
        flash[:notice] = '管理者ではないので閲覧できません'
        redirect_to  home_index_path
      end
    end
end
