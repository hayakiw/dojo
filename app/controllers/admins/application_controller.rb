class Admins::ApplicationController < ApplicationController
  protect_from_forgery with: :exception

  def logged_in_admin
    unless current_account.admin?
      flash[:notice] = '管理者ではないので閲覧できません'
      redirect_to  home_index_path
    end
  end
end
