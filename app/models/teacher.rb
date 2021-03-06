class Teacher < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :sections, :dependent => :destroy

  enum role: ["default", "admin"]
end
