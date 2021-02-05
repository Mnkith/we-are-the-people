desc = "Welcome to the Sinatra Template! If you're seeing this page, then everything is working
as expected. To get started, delete this file (<code>app/views/welcome.erb)</code> and begin adding
your own actions to <code>application_controller.rb</code>."




Cause.destroy_all

c1 = Cause.create name: 'Plant For The Planet', description: desc, image_link: 'images/im1.gif'
c2 = Cause.create name: 'c2', description: desc, image_link: 'images/im2.gif'
c3 = Cause.create name: 'c3', description: desc, image_link: 'images/im3.gif'
c4 = Cause.create name: 'c4', description: desc, image_link: 'images/im4.gif'
c5 = Cause.create name: 'c5', description: desc, image_link: 'images/im5.gif'
# c1.save 

# puts c1.errors.to_a
# c1.save validate: false