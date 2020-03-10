# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string   :nickname
      t.string   :first_name
      t.string   :last_name
      t.string   :first_kane
      t.string   :last_kane
      t.string   :prefecture
      t.string   :city
      t.string   :phone_number
      t.date     :birthday
      t.string   :profile
      t.string   :email
      t.string   :encrypted_password
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
