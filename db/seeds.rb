# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

admin = User.find_by_email("admin@domain.test")
if admin.nil?
  admin = User.new(:email => "admin@domain.test",
                   :password => "admin")
  File.open(File.join(Rails.root, 'spec/fixtures/images/users/admin.png')) do |file|
    image = admin.build_image
    image.file = file
  end
  authorization = admin.authorizations.build
  authorization.role = :admin
  admin.save!
end

