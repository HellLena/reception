# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(жалоба предложение заявление).each{|type|
  AppealType.create(:name => type)
}

%w(принять отказать перезвоню).each{|type|
  Decision.create(:name => type)
}

[:admin, :secretary, :minister].each{|type|
  Role.create(:name => type)
}