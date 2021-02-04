class Cause < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  # validates :description, presence: true
  validates :title, uniqueness: true

  has_many :donations
  has_many :advocates, through: :donations
end
