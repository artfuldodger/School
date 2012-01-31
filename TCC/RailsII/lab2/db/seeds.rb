# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = ['user', 'moderator', 'admin']
roles.each do |role|
  Role.create(name: role) unless Role.find_by_name(role)
end

admin_id = Role.find_by_name('admin').id
u = User.create({ email: 'admin@admin.com', role_id: admin_id, name: 'Admin', password: 'admin4ccount', password_confirmation: 'admin4ccount' })