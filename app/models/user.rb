class User

  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # 
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Custom fields
  field :name,               type: String
  field :admin,              type: Boolean
  # Count of services that user bought
  field :services, type: Hash, default: { :check_request => 0, :search_request => 0 }

  embeds_many :reviews

  field :reports_ids, type: Array


  validates :name, presence: true, length: { maximum: 25 }, format: { with: /^[a-zA-Z]*$/, :multiline => true }


  def after_database_authentication
    ago = Time.now - 5.minutes
    #self.update_attribute(:name, "Adminaa")
    #max = TwitterApi.trending_tweets.to_h
    if !self.last_sign_in_at.nil? and ago > self.last_sign_in_at
      #UserMailer.welcome_email(self.email,self.last_sign_in_at).deliver_now
    end
  end

  def give_service(service_type,count)
    #self.services.except!("Check request","Search request")
    self.services[service_type.to_sym] += count
    self.save
  end

  def have_service?(service_type)
    self.services[service_type.to_sym] > 0
  end

  def spend_service(service_type)
    self.services[service_type.to_sym] -= 1
    self.save
  end

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end

###Promocode
# require 'securerandom'
# long_code = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
# short_code = long_code[0..3] + '-' + long_code[4..7] + '-' + long_code[8..11]
