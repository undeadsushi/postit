class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :votes

	has_secure_password validations: false

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create, length: {minimum: 3}

  def admin?
    self.role.to_s == 'admin'
  end

  def moderator? 
  	self.role.to_s == 'moderator'
  end

end