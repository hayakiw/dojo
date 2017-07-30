class Customer < ApplicationRecord
    validates :name,    presence: true

    # validates :name,    presence: {message: "顧客名を入力してください"}
    # validates :status,  presence: {message: "有効または無効をチェックしてください"}
end
