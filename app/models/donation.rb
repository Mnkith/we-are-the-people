class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0}
  belongs_to :advocate, primary_key: "name", foreign_key: "advocate_name"
  belongs_to :cause, primary_key: "name", foreign_key: "cause_name"

  PRESET_AMOUNTS = [1, 3, 5, 7, 10]
end
