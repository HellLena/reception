# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# appeal_types
%w(жалоба предложение заявление).each{|type|
  AppealType.create(:name => type)
}

#decisions
%w(принять отказать перезвоню).each{|type|
  Decision.create(:name => type)
}

# roles
[:admin, :secretary, :minister].each{|type|
  Role.create(:name => type)
}

# ------------- TEST USERS -----------------
# Admin
user = User.new
user.email = "admin@test.com"
user.password = "test1234"
user.roles << Role.where(:name => :admin).first
user.save
# Secretary
user = User.new
user.email = "secretary@test.com"
user.password = "test1235"
user.roles << Role.where(:name => :secretary).first
user.save
# Minister
user = User.new
user.email = "minister@test.com"
user.password = "test1236"
user.roles << Role.where(:name => :minister).first
user.save