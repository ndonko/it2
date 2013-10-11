class Client < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :entreprise, :nom, :prenom, :telephone, :password, :password_confirmation
  
  has_many :projects, :dependent => :destroy
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  
  validates :nom,              :presence   => true,
                               :length     => { :maximum => 39 }
                               
  validates :prenom,           :presence   => true,
                               :length     => { :maximum => 39 }
   
  validates :entreprise,       :presence   => true,
                               :length     => { :maximum => 39 }                          
                                
  validates :email,            :presence   => true,
                               :format     => { :with =>email_regex },
                               :uniqueness => { :case_sensitive => false }
  
  validates :telephone,        :presence=>true
  
  #Cree automatiquement l'attribut virtuel 'password_confirmation'
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
        
   #new test
  before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!(validate: false)#save!
  ClientMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Client.exists?(column => self[column])
end
  
  #end new test
        
                       
      
  before_save :encrypt_password
  
  #retourne vrai si le mot de passe corespond
  def has_password?(password_soumis)
    #Compare encrypted_password avec la version crypte de password_soumis
    encrypted_password == encrypt(password_soumis)
  end
  
  def self.authenticate(email, password_soumis)
    client = find_by_email(email)
    return nil if client.nil?
    return client if client.has_password?(password_soumis)
  end
  
   def self.authenticate_with_salt(id, cookie_salt)
    client = find_by_id(id)
    (client && client.salt == cookie_salt) ? client : nil
  end
  
 
  
  private
  
     def encrypt_password
       self.salt = make_salt if new_record?
       self.encrypted_password = encrypt(password)
     end                 
      
     def encrypt(string)
       secure_hash("#{salt}--#{string}")
     end 
     
     def make_salt
       secure_hash("#{Time.now.utc}--#{password}")
     end
     
     def secure_hash(string)
       Digest::SHA2.hexdigest(string)
     end
  
end
