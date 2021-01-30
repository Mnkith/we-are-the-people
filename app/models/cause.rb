class Cause < ActiveRecord::Base
  # validates :description, presence: true
  validates :title, uniqueness: true
end
