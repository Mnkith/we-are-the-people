class Donation < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
