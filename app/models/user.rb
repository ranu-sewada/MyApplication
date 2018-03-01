class User < ApplicationRecord

  rolify

  has_many :job
  has_many :applied_user,   :foreign_key => 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
end
