class CustomerProject < ApplicationRecord
  WORK_TYPE_MAINTENANCE = 'maintenance'
  WORK_TYPE_NEW = 'new'

  validates :name,    presence: true
  validates :work_days, presence: true, numericality: true
  validates :work_type, presence: true


  belongs_to  :customer
  has_many    :customer_project_works
  has_many    :working_report_times
end
