class WorkingReportDay < ApplicationRecord
  belongs_to :account

  validates :account_id,    presence: true
  validates :date,    presence: true
end
