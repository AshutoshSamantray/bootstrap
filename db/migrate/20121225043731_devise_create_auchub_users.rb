class DeviseCreateAuchubUsers < ActiveRecord::Migration
  def self.up
    create_table(:auchub_users) do |t|
      t.integer :id, :primary_key => true, :null => false

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token

      t.string :slug
      t.timestamps
    end

    add_index :auchub_users, [:email],                :unique => true
    add_index :auchub_users, [:reset_password_token], :unique => true
    add_index :auchub_users, [:confirmation_token],   :unique => true
    add_index :auchub_users, [:unlock_token],         :unique => true
    add_index :auchub_users, [:authentication_token], :unique => true
    add_index :auchub_users, [:slug],                 :unique => true
  end

  def self.down

    remove_index :auchub_users, [:authentication_token]
    remove_index :auchub_users, [:unlock_token]
    remove_index :auchub_users, [:confirmation_token]
    remove_index :auchub_users, [:reset_password_token]
    remove_index :auchub_users, [:email]

    drop_table :auchub_users
  end
end
