class ChangeDatatypeTextOfGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :text, :text
  end
end
