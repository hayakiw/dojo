class WorkingReportTime < ApplicationRecord
  belongs_to :account
  belongs_to :customer_project
  belongs_to :customer_project_work

  def customer_opts
    customers = Customer.where(status:1).order("name").pluck(:name, :id)
    customers.unshift(["選択してください", ""])
  end
  def project_opts
    projects = Array.new()
    if customer_project_id
      projects = CustomerProjectWork.where(customer_project_id: params[:project_id]).pluck(:name, :id)
    end
    projects.unshift(["選択してください", ""])
  end

  def work_opts
    works = Array.new()
    if customer_project_work_id
      works = CustomerProjectWork.where(customer_project_id: params[:project_id]).pluck(:name, :id)
    end
    works.unshift(["選択してください", ""])
  end

  def place_opts
    {
      "選択してください": "",
      "eBase Lab" =>
      "eBase Lab",
      "other" => "other"
    }
  end
end
