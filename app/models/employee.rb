class Employee < ApplicationRecord
  has_many :job
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
