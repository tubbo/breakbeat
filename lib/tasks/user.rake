desc "Quick rake task for defining your own user."
task :user do
  User.create \
    email: ENV['USER_EMAIL'],
    password: ENV['USER_PASSWORD'],
    password_confirmation: ENV['USER_PASSWORD']
end
