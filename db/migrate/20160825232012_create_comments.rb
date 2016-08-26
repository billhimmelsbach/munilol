class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :vote

      t.timestamps null: false
    end
  end
end
