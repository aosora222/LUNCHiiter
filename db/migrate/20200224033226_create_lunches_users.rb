class CreateLunchesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches_users do |t|
      t.references :lunch, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
