class Lunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.string     :name,          null: false
      t.string     :main,          null: false
      t.string     :tel,           null: false
      t.string     :addless,       null: false, foreign_key: true
      t.string     :parking,       null: false
      t.string     :business_day,  null: false
      t.string     :business_time, null: false
      t.string     :holiday,       null: false
      t.string     :budget,        null: false
      t.string     :hp
      t.string     :remarks
      t.timestamps
    end
  end
end
