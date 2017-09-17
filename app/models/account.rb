class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLE_ADMIN = 'administrator'
  ROLE_EMPLOYEE = 'employee'
  ROLE_TRIAL = 'trial'


  validates :name, presence: true
  validates :role, presence: true

  has_many :working_report_times
  has_many :Working_report_days

  def rolename
    case role
    when ROLE_ADMIN
      '管理者'
    when ROLE_EMPLOYEE
      '正社員'
    when ROLE_TRIAL
      '試用期間'
    end
  end

end
