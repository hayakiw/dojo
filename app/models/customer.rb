class Customer < ApplicationRecord
    validates :name,    presence: true

    has_many :customer_projects
end
