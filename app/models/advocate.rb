class Advocate < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  has_many :donations
  has_many :causes, through: :donations
end
