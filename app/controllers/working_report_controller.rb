class WorkingReportController < ApplicationController
  def index
    @report_at = params[:report_at]
  end

  def get_projects
    @row_id = params[:row_id]
    @projects = CustomerProject.where(customer_id: params[:customer_id]).pluck(:name, :id)
    @projects.unshift(["選択してください", ""])
  end
end
