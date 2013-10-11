require 'faker'

namespace :db do
  desc "Remplissage de la base de donnees avec des messages fictifs"
  task :populate => :environment do
    
    Client.all(:limit => 6).each do |client|
      50.times do
        client.projects.create!(:question1 => Faker::Lorem.sentence(5), :question2 => Faker::Lorem.sentence(5))
        #client.projects.create!(:question2 => Faker::Lorem.sentence(5))
      end
    end
  end
end
   
