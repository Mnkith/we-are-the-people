class Cause < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  
  validates :name, uniqueness: true, presence: true
  validates :goal, presence: true, numericality: { only_integer: true, greater_than: 0}

  has_many :donations, primary_key: "name", foreign_key: "cause_name"
  has_many :advocates, through: :donations
end
