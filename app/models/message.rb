# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  prenom     :string(255)
#  entreprise :string(255)
#  lieu       :string(255)
#  telephone  :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :email, :entreprise, :lieu, :message, :nom, :prenom, :telephone  
  
  numero_regex = /\d/i
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates  :email,         :presence => true,
                             :format   => { :with => email_regex },
                             :uniqueness => { :case_sensitive => false }
                             
  validates  :entreprise,    :presence => true
  
  validates  :lieu,          :presence => true
  
  validates  :message,       :presence => true
  
  validates  :nom,           :presence => true,
                             :length   => {:maximum => 20 }
                             
  validates  :prenom,        :presence => true,
                             :length   => {:maximum => 20 } 
                             
  validates  :telephone,     :presence => true,
                             :format => { :with => numero_regex },
                             :length => {:maximum => 20 }
end
