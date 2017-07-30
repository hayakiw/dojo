class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    if params[:status] && params[:status] == '1'
        @customers = Customer.page(params[:page]).order("created_at DESC")
    else
        @customers = Customer.where(status:1).page(params[:page]).order("created_at DESC")
    end
    @status = params[:status]
  end

  def show
  end

  def new
    @customer = Customer.new
    render layout: "modal"
  end

  def edit
    render layout: "modal"
  end

  def create
    # test
    logger.debug("===== Customer#create =======")
    logger.debug(customer_params)

    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  def update
    # test
    logger.debug("===== Customer#update =======")
    logger.debug(customer_params)

    respond_to do |format|
      if @customer.update_attributes(customer_params)
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :status)
    end
end
