class Department < ApplicationRecord
  has_many :department_with_users
  has_many :users, through: :department_with_users

  enum name: { "魔法部": 0,
               "黑魔法圖書館": 1,
               "斜角巷福利巷": 2,
               "活米村餐廳": 3,
               "萬應室": 4,
               "葛來分多": 5,
               "赫夫帕夫": 6,
               "雷文克勞": 7,
               "史萊哲林": 8
              }
end