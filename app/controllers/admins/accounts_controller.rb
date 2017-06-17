class Admins::AccountsController < Admins::ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
  end

  # def show
  #   #code
  # end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_customer
      @account = Account.find(params[:id])
    end
end
