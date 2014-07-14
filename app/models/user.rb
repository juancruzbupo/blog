class User < ActiveRecord::Base
    
  attr_accessor :password_hash
  before_save :encrypt_password
  
  validates_confirmation_of :password_hash
  validates_presence_of :password_hash, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
    
  def self.authenticate(email, password_hash)
    user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.digest(password_hash)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    self.password_hash = Digest::MD5.digest(password_hash)
  end

end
