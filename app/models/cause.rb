class Cause < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  
  validates :name, uniqueness: true, presence: true
  validates :goal, presence: true, numericality: { only_integer: true, greater_than: 0}

  before_save :check_met

  private 

    def check_met
      if self.current >= self.goal 
        self.met = true
        self.current = self.goal 
      end
    end



  has_many :donations, primary_key: "name", foreign_key: "cause_name"
  has_many :advocates, through: :donations
end
