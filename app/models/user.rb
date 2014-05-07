class User < ActiveRecord::Base
  has_secure_password
  before_save :set_auth_token



  validates_presence_of :name, :email
  validates_uniqueness_of :email, :username


  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end

end
