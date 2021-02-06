class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  belongs_to :advocate
  belongs_to :cause

  PRESET_AMOUNTS = [1, 3, 5, 7, 10]
end
