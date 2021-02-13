class Cause < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  # validates :description, presence: true
  validates :name, uniqueness: true, presence: true
  validates :goal, presence: true, numericality: { only_integer: true, greater_than: 0}

  has_many :donations
  has_many :advocates, through: :donations
end
