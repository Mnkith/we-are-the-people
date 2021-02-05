class Advocate < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  # include ActiveRecord::Validations

  validates :email, uniqueness: true, presence: true
  validates :passowrd, presence: true
  validates :passowrd_confirmation, presence: true
  validates :passowrd, confirmation: true
  validates :passowrd_confirmation, presence: true

  has_many :donations
  has_many :causes, through: :donations
end
