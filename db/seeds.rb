puts 'Running seed...'

User.create!(
  email: 'admin@example.com', password: 'password',
  password_confirmation: 'password', admin: true
) unless Rails.env.production?

puts 'Seed successfully run.'
