class WorkingReportController < ApplicationController
  def index
    @report_at = params[:report_at]
  end
end
