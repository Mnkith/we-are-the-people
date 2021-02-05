class Advocate < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  # include ActiveRecord::Validations

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_many :donations
  has_many :causes, through: :donations
end
