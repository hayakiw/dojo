class Admins::AccountsController < Admins::ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.all
    render layout: 'application'
  end

  def new
    @account = Account.new
    render layout: 'modal'
  end

  def create
    @account = Account.new(user_params)
    if @account.save
      redirect_to admins_accounts_path
    else
      # todo error alert
      render 'new'
    end
  end

  # def show
  #   #code
  # end

  def edit
    render layout: 'modal'
  end

  def update
    if @account.update(user_params)
      redirect_to admins_accounts_path
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to admins_accounts_path, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @account = Account.find(params[:id])
    end

    def user_params
      params.require(:account).permit(:name, :email, :password, :role)
    end
end
