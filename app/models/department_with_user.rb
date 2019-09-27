class DepartmentWithUser < ApplicationRecord
  belongs_to :user, class_name: 'Department'
  belongs_to :department, class_name: 'Department'
end