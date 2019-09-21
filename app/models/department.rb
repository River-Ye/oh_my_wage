class Department < ApplicationRecord
  has_many :department_with_users
  has_many :users, through: :department_with_users
end