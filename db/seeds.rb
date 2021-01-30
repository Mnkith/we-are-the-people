c1 = Cause.new title: 'c1'
c1.save 

puts c1.errors.to_a
# c1.save validate: false
# Cause.destroy_all