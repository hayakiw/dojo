class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :role, presence: true

  has_many :working_report_times
  has_many :Working_report_days

  def rolename
    case role
    when 'administrator'
      '管理者'
    when 'employee'
      '正社員'
    when 'trial'
      '試用期間'
    end
  end

end
