namespace :admin do
  task :build => :environment do
    User.create(first_name: 'Admin', last_name: 'One', password: 'AdminOne2017!', email: 'admin.one@robo.com', admin: true)
  end
end
