class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :section_students, :dependent => :destroy
  has_many :sections, through: :section_students
  has_many :observations, :dependent => :destroy
end
