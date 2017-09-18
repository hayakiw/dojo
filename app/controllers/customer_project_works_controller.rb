class CustomerProjectWorksController < ApplicationController
  before_action :logged_in_account
  before_action :set_customer_project_work, only: [:edit, :update, :destroy]
  before_action :set_customer_project, only: [:new, :create]


  # GET /customer_project_works/new
  def new
    @customer_project_work = CustomerProjectWork.new
    render layout: "modal"
  end

  # GET /customer_project_works/1/edit
  def edit
    @customer_project = @customer_project_work.customer_project
    render layout: "modal"
  end

  # POST /customer_project_works
  # POST /customer_project_works.json
  def create
    @customer_project_work = CustomerProjectWork.new(customer_project_work_params)
    @customer_project_work.customer_project_id = @customer_project.id
    @customer_project_work.customer_id = @customer_project.customer_id

    # create_valid用に@customer作成
    @customer = @customer_project_work.customer

    respond_to do |format|
      if @customer_project_work.save
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  # PATCH/PUT /customer_project_works/1
  # PATCH/PUT /customer_project_works/1.json
  def update
    # create_valid用に@customer作成
    @customer = @customer_project_work.customer

    respond_to do |format|
      if @customer_project_work.update(customer_project_work_params)
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  # DELETE /customer_project_works/1
  # DELETE /customer_project_works/1.json
  def destroy
    @customer_project_work.destroy
    respond_to do |format|
      format.html { redirect_to customer_project_works_url, notice: 'Customer project work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_project_work
      @customer_project_work = CustomerProjectWork.find(params[:id])
    end

    def set_customer_project
      @customer_project =  CustomerProject.find(params[:customer_project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_project_work_params
      params.fetch(:customer_project_work, {})
      params.require(:customer_project_work).permit(:name, :price)
    end
end
