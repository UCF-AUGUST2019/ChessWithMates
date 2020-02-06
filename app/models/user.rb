class User < ApplicationRecord
  attr_writer :login
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :games
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, authentication_keys: [:login]

  after_create :set_score_defaults

  def set_score_defaults
      update_attributes(num_wins: 0, num_ties: 0)
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
	end

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
  end
  
end
