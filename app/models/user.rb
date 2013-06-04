# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  coins           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  has_many :workers
  attr_accessible :coins, :email, :name, :password, :password_confirmation
  has_secure_password


  before_save { |user| user.email = email.downcase }
  

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  VALID_COINS_REGEX= /\A\d+(\.\d)?\d*\z/
  validates :coins, format: { with: VALID_COINS_REGEX }

end
