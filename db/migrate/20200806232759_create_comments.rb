class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
