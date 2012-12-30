class AuchubUser < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slugged_userid, :use => :slugged

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,
         :timeoutable

  # Attribute for paper_trail
  has_paper_trail :on => [:create, :update, :destroy],
                  :only => [:email, :reset_password_sent_at, :sign_in_count, 
                            :current_sign_in_ip, :last_sign_in_ip, :confirmed_at, 
                            :locked_at, :failed_attempts ],
                  :skip => [:encrypted_password, :reset_password_token, :confirmation_token, :authentication_token]
                   
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :encrypted_password, :password_confirmation, 
                  :remember_me, :reset_password_sent_at, :sign_in_count, 
                  :current_sign_in_ip, :last_sign_in_ip, :confirmed_at,
                  :locked_at, :failed_attemts, :id, :slug

  def slugged_userid
    UUID.new
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
