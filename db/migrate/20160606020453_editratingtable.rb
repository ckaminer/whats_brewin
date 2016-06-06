class Editratingtable < ActiveRecord::Migration
  def change
    remove_column :ratings, :rating
    add_column :ratings, :value, :integer
  end
end
