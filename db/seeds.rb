puts 'Running seed...'

User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin = true
end unless Rails.env.production?

puts 'Seed successfully run.'
