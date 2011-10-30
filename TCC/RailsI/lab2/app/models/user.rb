require 'digest/sha2'

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :presence => true

  def generate_codes!
    update_attribute(:confirmation_code, generate_confirmation_code)
    update_attribute(:cancelation_code,  generate_cancelation_code)
  end

  def password=(password)
    self.password_salt = generate_salt
    self.password_hash = User.generate_password_hash(password, self.password_salt)
  end

  def password
    ''
  end

  def self.authenticate(username, password)
    begin
      user = User.find_by_username!(username)
      hashed_password = User.generate_password_hash(password, user.password_salt)
      return user if user.password_hash == hashed_password
    rescue
    end

    raise 'Invalid username/password combination.'
  end

  def verify!(code)
    if code == self.confirmation_code
      return update_attribute(:verified, true)
    end
    return false
  end

  def self.cancel!(user, code)
    if code == user.cancelation_code
      user.delete
      return true
    end
    return false
  end

  # This actually returns an ActiveRecord::Relation;
  # if you really need an Array back (as stated in the requirements),
  # then this line would work:
  # User.find(:all, :conditions => ['verified = ?', true])
  def self.verified
    User.where(:verified => true)
  end

  private

  def self.generate_password_hash(password, salt)
    Digest::SHA256.hexdigest( password + salt ) 
  end

  def generate_confirmation_code
    Digest::SHA256.hexdigest( self.email + self.id.to_s )
  end

  def generate_cancelation_code
    Digest::SHA256.hexdigest( self.username + self.email + self.id.to_s )
  end

  def generate_salt
    [Array.new( 6 ){rand( 256 ).chr}.join].pack( "m" ).chomp
  end
end