class DepartmentWithUser < ApplicationRecord
  belongs_to :user, class_name: 'User', dependent: :destroy
  belongs_to :department, class_name: 'Department', dependent: :destroy
end