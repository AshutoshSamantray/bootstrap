class AuchubUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable

  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,
         :timeoutable

  # Attribute for paper_trail
  # has_paper_trail :on => [:create, :update, :destroy],
  #                 :only => [:email, :reset_password_sent_at, :sign_in_count, 
  #                           :current_sign_in_ip, :last_sign_in_ip, :confirmed_at, 
  #                           :locked_at, :failed_attempts ],
  #                 :skip => [:encrypted_password, :reset_password_token, :confirmation_token, :authentication_token]
                   
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

end
