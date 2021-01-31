module Slug 
  module InstanceMethods
    def slug 
      title.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(s)
      self.all.find{|thing| thing.slug == s}
    end
  end
end