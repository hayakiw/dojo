class CustomerProjectWork < ApplicationRecord
  belongs_to :customer
  belongs_to :customer_project
  has_many   :working_report_times

  validates :name, presence: true
  validates :price, presence: true, numericality: true
end
