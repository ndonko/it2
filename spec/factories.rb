#en utilisant le symbole ':client', nous faisons que
# Factory Girl simule un modele User

Factory.define :client do |client|
   client.nom                    "Pany Ndonko"
   client.prenom                 "Tanguy"
   client.email                  "tanguy@example.de"
   client.entreprise             "it2Solutions"
   client.telephone              "7874724234727"
   client.password               "foobar"
   client.password_confirmation  "foobar"
   
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :project do |project|
   project.question1 "foo bar"
   project.question2 "foo bar"
   project.question3 "foo bar"
   project.question4 "foo bar"
   project.question5 "foo bar"
   project.question6 "foo bar"
   project.question7 "foo bar"
   project.question8 "foo bar"
   project.question9 "foo bar"
   project.question10 "foo bar"
   project.question11 "foo bar"
   project.question12 "foo bar"
   project.question13 "foo bar"
   project.question14 "foo bar"
   project.question15 "foo bar"
   project.question16 "foo bar"
   project.question17 "foo bar"
   project.question18 "foo bar"
   project.question19 "foo bar"
   project.question20 "foo bar"
   project.question21 "foo bar"
   project.question22 "foo bar"
   project.question23 "foo bar"
   project.question24 "foo bar"
   project.question25 "foo bar"
   project.question26 "foo bar"
   project.question27 "foo bar"
   project.question28 "foo bar"
   project.question29 "foo bar"
   project.question30 "foo bar"
   project.association :client
end
