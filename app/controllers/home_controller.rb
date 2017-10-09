class HomeController < ApplicationController
  def index
    @today = Date.today
    year = params[:year].nil? ? @today.year : params[:year].to_i
    month = params[:month].nil? ? @today.month : params[:month].to_i
    @calender_day = Date.new(year, month, 1)
  end
end
