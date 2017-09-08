class Section < ApplicationRecord
  validates :name, presence: true
  belongs_to :teacher
  has_many :section_students, :dependent => :destroy
  has_many :students, through: :section_students
end
