class User < ApplicationRecord
  extend FriendlyId
  friendly_id :number, use: :slugged

  include Devise::Models::Trackable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :timeoutable, :timeout_in => 30.minutes

  paginates_per 10

  has_many :salaries, -> { order(date: :desc) }, dependent: :destroy
  has_many :reply_to_issues, dependent: :destroy
  has_many :department_with_users, dependent: :destroy
  has_many :departments, through: :department_with_users, dependent: :destroy

  accepts_nested_attributes_for :salaries, reject_if: :all_blank, allow_destroy: true

  validates :name, :role, :number, :phone, presence: true
  validates :number, uniqueness: true
  validates :phone, length: { is: 10 }
  
  enum role: { admin: 0, staff: 1, student: 2 }
  enum gender: { Male: 0, Female: 1 }

  scope :admin_order, -> { order(role: :asc).order(number: :asc) }
  scope :student_order, -> { where(role: 2).order(number: :asc) }

  # KT 寫法
  # scope :without_department, -> (dep) { joins(:departments).where.not('departments.name = ?', dep) }

  def self.search(search)
    return all if search.blank?
    if search
      where(['name || email || number || role || phone || gender LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end