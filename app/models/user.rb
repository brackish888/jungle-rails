class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, :password_confirmation, length: { minimum: 5 }, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      return @user
    end
  end
  nil

end 
