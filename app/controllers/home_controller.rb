class HomeController < ApplicationController
  def index
    @today = Date.today
  end
end
