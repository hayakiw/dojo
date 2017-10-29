class WorkingReportController < ApplicationController
  def index
    @report_at = params[:report_at]
    if @report_at.blank?
      @report_at = Date.today.strftime('%Y-%m-%d')
    end
    @working_report_times = WorkingReportTime.where(date: @report_at, account_id: current_account.id.to_i)
    @working_report_day = WorkingReportDay.where(date: @report_at, account_id: current_account.id.to_i).first
  end

  def update_time
    @id = params[:id]
    key = params[:key]
    value = params[:value]
    @class_id = params[:class_id]
    report_at = params[:report_at]

    # validation and update
    @res = false
    if @id.blank?
      report = WorkingReportTime.new({
        "date" => report_at,
        "account_id" => current_account.id.to_i,
        "created_at" => Time.now,
        "updated_at" => Time.now,
        key => value
      })
      @res = report.save
      @id = report.id
    else
      report = WorkingReportTime.find(@id)
      @res = report.update({
        "updated_at" => Time.now,
        key => value
      })
    end
  end

  def update_day
    @id = params[:id]
    key = params[:key]
    value = params[:value]
    report_at = params[:report_at]

    @res = false
    if @id.blank?
      report = WorkingReportDay.new({
        "date" => report_at,
        "account_id" => current_account.id.to_i,
        "created_at" => Time.now,
        "updated_at" => Time.now,
        key => value
      })
      @res = report.save
      @id = report.id
    else
      report = WorkingReportDay.find(@id)
      @res = report.update({
        "updated_at" => Time.now,
        key => value
      })
    end
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
