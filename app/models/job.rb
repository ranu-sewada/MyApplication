class Job < ApplicationRecord
  belongs_to :user
  has_many :applied_user, :foreign_key => 'job_id'
  validates :title, presence: true
  validates :post, presence: true


end
