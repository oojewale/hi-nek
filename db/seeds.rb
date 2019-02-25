puts 'Running seed...'

User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin = true
end unless Rails.env.production?

%w(APC PDP).each { |code| Party.find_or_create_by!(code: code) }

%w(President Governor Senator).each { |name| Office.find_or_create_by!(name: name) }

puts 'Seed successfully run.'
