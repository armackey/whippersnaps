class User
  include Mongoid::Document
  field :username, type: String  
  field :email, type: String
  field :password_digest, type: String
  field :image_description, type: String
  field :title, type: String


  has_many :photos
  
  #password validation
  attr_reader :password

  # encrypts password
	def password=(unencrypted_password)
		unless unencrypted_password.empty?
	    # use BCrypt to encrypt our plain password into a digest
	    # and store it in our database
	    # create password instance variable
	    @password = unencrypted_password
	    self.password_digest = BCrypt::Password.create(unencrypted_password)
	  end
	end




	def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end

  	# user must enter username, email, password
	
      validates :username, presence: true, uniqueness: true, on: :create
      validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
      validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create
      validates :password, presence: true, confirmation: true, length: { in: 6..20 }, :allow_blank => true, :on => :update
end













