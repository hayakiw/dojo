class WorkingReportController < ApplicationController
  def index
    @report_at = params[:report_at]
    if @report_at.blank?
      @report_at = Date.today.strftime('%Y-%m-%d')
    end
    @working_report_times = WorkingReportTime.where(date: @report_at, account_id: current_account.id.to_i)
  end

  def update_db
    @id = params[:id]
    @key = params[:key]
    @value = params[:value]

    # TODO validation and update
  end

  def get_projects
    @row_id = params[:row_id]
    @projects = CustomerProject.where(customer_id: params[:customer_id]).pluck(:name, :id)
    @projects.unshift(["選択してください", ""])
  end

  def get_works
    @row_id = params[:row_id]
    @works = CustomerProjectWork.where(customer_project_id: params[:project_id]).pluck(:name, :id)
    @works.unshift(["選択してください", ""])
  end

  def add_row
    @index = params[:index]
  end
end
