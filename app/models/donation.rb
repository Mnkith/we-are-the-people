class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0}
  belongs_to :advocate
  belongs_to :cause

  PRESET_AMOUNTS = [1, 3, 5, 7, 10]
end
