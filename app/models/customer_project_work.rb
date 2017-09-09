class CustomerProjectWork < ApplicationRecord
  belongs_to :customer_project
  has_many   :working_report_times
end
