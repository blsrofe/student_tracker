class Observation < ApplicationRecord
  validates :date, presence: true
  validates :content, presence: true
  belongs_to :student
end
