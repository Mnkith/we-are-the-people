desc = "Welcome to the Sinatra Template! If you're seeing this page, then everything is working
as expected. To get started, delete this file (<code>app/views/welcome.erb)</code> and begin adding
your own actions to <code>application_controller.rb</code>."




Cause.destroy_all

c1 = Cause.create title: 'Plant For The Planet', description: desc, image_link: 'images/im1.gif'
c2 = Cause.create title: 'c2', description: desc, image_link: 'images/im2.gif'
c3 = Cause.create title: 'c3', description: desc, image_link: 'images/im3.gif'
c4 = Cause.create title: 'c4', description: desc, image_link: 'images/im4.gif'
c5 = Cause.create title: 'c5', description: desc, image_link: 'images/im5.gif'
# c1.save 

# puts c1.errors.to_a
# c1.save validate: false