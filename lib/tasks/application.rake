namespace :application do
  desc "TODO"
  task load_data: :environment do

    %w(жалоба предложение заявление).each{|type|
      AppealType.create(:name => type)
    }

    %w(принять отказать перезвоню).each{|type|
      Decision.create(:name => type)
    }

  end

end
