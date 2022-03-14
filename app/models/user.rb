class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials email, password
    user = self.find_by_email email

    return user if user && user.authenticate(password)
    
    nil
  end

end
