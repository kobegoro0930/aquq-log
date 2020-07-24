class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      # t.references :user,           foreign_key: true
      t.string :name,               null: false, unique: true
      t.string :catchphrase,        null: false
      t.string :title,              null: false
      t.string :text,               null: false
      t.string :area,               null: false
      t.timestamps
    end
  end
end
