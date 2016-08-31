class AddSlugToMunis < ActiveRecord::Migration
  def change
    add_column :munis, :slug, :string
    add_index :munis, :slug, unique: true
  end
end
