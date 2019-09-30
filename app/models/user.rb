class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,  :timeoutable, :timeout_in => 30.minutes

  paginates_per 10

  has_many :salaries, dependent: :destroy
  has_many :reply_to_issues, dependent: :destroy
  has_many :department_with_users, dependent: :destroy
  has_many :departments, through: :department_with_users, dependent: :destroy

  accepts_nested_attributes_for :salaries, reject_if: :all_blank, allow_destroy: true

  validates :name, :role, :number, :phone, presence: true
  validates :number, uniqueness: true
  validates :phone, length: { is: 10 }
  
  enum role: { admin: 0, staff: 1, student: 2 }
  enum gender: { Male: 0, Female: 1 }
end