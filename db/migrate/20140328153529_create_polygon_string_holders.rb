class CreatePolygonStringHolders < ActiveRecord::Migration
  def change
    create_table :polygon_string_holders do |t|
      t.string :coords

      t.timestamps
    end
  end
end
