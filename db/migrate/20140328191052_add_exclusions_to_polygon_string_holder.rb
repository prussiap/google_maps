class AddExclusionsToPolygonStringHolder < ActiveRecord::Migration
  def change
    add_column :polygon_string_holders, :exclusions, :string
  end
end
