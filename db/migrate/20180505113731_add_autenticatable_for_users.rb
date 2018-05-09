class AddAutenticatableForUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :password_digest
      t.string :auth_tokens
      t.string :unconfirmed_email
      t.string :confirmation_token
      t.datetime :confirmation_sent_at
      t.datetime :confirmed_at
    end
  end
end
