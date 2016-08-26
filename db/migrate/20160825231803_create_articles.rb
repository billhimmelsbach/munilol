class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :vote_total
      t.belongs_to :muni, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
