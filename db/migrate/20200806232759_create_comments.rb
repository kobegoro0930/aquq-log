class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :text, null: false
      t.date :visit_date, null: false
      t.timestamps
    end
  end
end
