namespace :app do
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nSorry can't drop prod. database."
    end
  end
  
  desc "Reset"
  task :reset => ["db:drop", "db:create", "db:migrate", "db:seed", "app:populate"]
  
  desc "Populate the db with dev data."
  task :populate => :environment do
    [
      {:first_name => "Darth",     :last_name => "Vader"},
      {:first_name => "Commander", :last_name => "Praji"},
      {:first_name => "Biggs",     :last_name => "Darklighter"},
      {:first_name => "Luke",      :last_name => "Skywalker"},      
      {:first_name => "Han",       :last_name => "Solo"},      
      {:first_name => "Lando",     :last_name => "Calrissian"},              
    ].each do |attributes|
      Person.find_or_create_by_first_name_and_last_name(attributes)
    end
  end
end