class CustomerProjectsController < ApplicationController
  before_action :set_customer_project, only: [:show, :edit, :update, :destroy]

  def index
    @customer_projects = CustomerProject.all
  end

  # GET /customer_projects/1
  # GET /customer_projects/1.json
  def show
  end

  # GET /customer_projects/new
  def new
    @customer_project = CustomerProject.new
    render layout: "modal"
  end

  # GET /customer_projects/1/edit
  def edit
    render layout: "modal"
  end

  # POST /customer_projects
  # POST /customer_projects.json
  def create
    @customer_project = CustomerProject.new(customer_project_params)

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_project_params
      params.require(:customer_project).permit(:name, :work_type, :work_days)
    end
end
