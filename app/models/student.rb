class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :parent_name, presence: true
  has_many :groups
  has_many :teachers, through: :groups
end
