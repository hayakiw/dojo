class Admins::AccountsController < Admins::ApplicationController
  before_action :authenticate_account!
  before_action :logged_in_admin
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
    respond_to do |format|
      if @account.save
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  def edit
    render layout: 'modal'
  end

  def update
    respond_to do |format|
      if @account.update_attributes(user_params)
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_invalid'}
      end
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
