class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :salaries, dependent: :destroy
  has_many :reply_to_issues, dependent: :destroy
  has_many :department_with_users, dependent: :destroy
  has_many :departments, through: :department_with_users, dependent: :destroy

  accepts_nested_attributes_for :salaries

  validates :name, :role, :number, :phone, presence: true
  validates :number, uniqueness: true
  
  enum role: { admin: 0, staff: 1, student: 2 }
  enum gender: { Male: 0, Female: 1 }
end