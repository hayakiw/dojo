class WorkingReportTime < ApplicationRecord
  belongs_to :account
  belongs_to :customer_project
  belongs_to :customer_project_work
end
