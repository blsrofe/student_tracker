class Observation < ApplicationRecord
  validates :date, presence: true
  validates :content, presence: true
  validates :teacher, presence: true
  belongs_to :student
end
