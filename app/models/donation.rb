class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  PRESET_AMOUNTS = [1, 3, 5, 7, 9]

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0}
  belongs_to :advocate, primary_key: "name", foreign_key: "advocate_name"
  belongs_to :cause, primary_key: "name", foreign_key: "cause_name"

  def date_created
    self.created_at.strftime("%m/%d/%Y")
  end

end
