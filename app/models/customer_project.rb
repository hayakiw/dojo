class CustomerProject < ApplicationRecord
  validates :name,    presence: true

  belongs_to  :customer
  has_many    :customer_project_works
  has_many    :working_report_times
end
