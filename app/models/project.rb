class Project < ActiveRecord::Base
  attr_accessible  :question1, :question2 ,:question3,:question4,:question5,:question6,:question7,:question8,
  :question9,:question10,:question11,:question12,:question13,:question14,:question15,:question16,:question17,
  :question18,:question19,:question20,:question21,:question22,:question23,:question24,:question25,:question26,
  :question27,:question28,:question29,:question30
  
  belongs_to :client
  
  validates :question1, :presence => true, :length =>{ :maximum => 140 }
  validates :question2, :presence => true
  validates :question3, :presence => true
  validates :question4, :presence => true
  validates :question5, :presence => true
  validates :client_id, :presence => true
  
  default_scope :order => 'projects.created_at DESC'
  
   
end
