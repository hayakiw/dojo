class CustomerProjectsController < ApplicationController
  before_action :logged_in_account
  before_action :set_customer_project, only: [:edit, :update, :destroy]
  before_action :set_customer, only: [:new, :create]

  def index
    @customer_projects = CustomerProject.where(customer_id: params[:customer_id])
  end

  # GET /customer_projects/new
  def new
    @customer_project = @customer.customer_projects.build
    render layout: "modal"
  end

  # GET /customer_projects/1/edit
  def edit
    @customer = @customer_project.customer
    render layout: "modal"
  end

  # POST /customer_projects
  # POST /customer_projects.json
  def create
    @customer_project = CustomerProject.new(customer_project_params)
    @customer_project.customer_id = @customer.id
    respond_to do |format|
      if @customer_project.save
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'new', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  # PATCH/PUT /customer_projects/1
  # PATCH/PUT /customer_projects/1.json
  def update
    @customer = @customer_project.customer
    respond_to do |format|
      if @customer_project.update(customer_project_params)
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_valid'}
      else
        format.html {render 'edit', layout: "modal"}
        format.js {render 'create_invalid'}
      end
    end
  end

  # DELETE /customer_projects/1
  # DELETE /customer_projects/1.json
  def destroy
    @customer_project.destroy
    respond_to do |format|
      format.html { redirect_to customer_projects_url, notice: 'Customer project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_project
      @customer_project = CustomerProject.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_project_params
      params.require(:customer_project).permit(:name, :work_type, :work_days)
    end
end
