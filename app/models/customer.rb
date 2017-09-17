class Customer < ApplicationRecord
    has_many :customer_projects
    has_many :customer_project_works

    validates :name,    presence: true
end
