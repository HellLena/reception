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

# ------------- TEST APPEALS -----------------
(1..10).each{|i|
  application = Application.new
  application.applicant = "TestName #" + i.to_s
  application.subject = "TestSubject #" + i.to_s + ". But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"
  application.contacts = "TestContact #" + i.to_s + "e-mail: test@test.com, phone: 5555555"
  application.appeal_type = AppealType.where(:name => %w(жалоба предложение заявление).sample).first
  application.save
}
