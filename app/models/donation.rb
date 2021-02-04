class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  belongs_to :advocate
  belongs_to :cause
end
