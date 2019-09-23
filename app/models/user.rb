class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :salaries
  has_many :reply_to_issues
  has_many :department_with_users
  has_many :departments, through: :department_with_users

  # 學號/教師編號、信箱要是唯一值
  # validates :number, :email, uniqueness: true
end