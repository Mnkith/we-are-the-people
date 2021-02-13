class Advocate < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  
  validates :name, exclusion: { in: ['admin'], message: "%{value} is reserved." }
  validates :name, presence: { message: "must be given please" }, uniqueness: true
  validates :email, exclusion: { in: ['admin@wap.com'], message: "%{value} is reserved." }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :donations
  has_many :causes, through: :donations
end
