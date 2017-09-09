class CustomerProject < ApplicationRecord
  validates :name,    presence: true
  belongs_to :customer
end
