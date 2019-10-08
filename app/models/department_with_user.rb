class DepartmentWithUser < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :department, class_name: 'Department'
end