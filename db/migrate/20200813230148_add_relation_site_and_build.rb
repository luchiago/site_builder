class AddRelationSiteAndBuild < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :current_build_id, :bigint
    add_foreign_key :sites, :builds, column: :current_build_id
    add_index :sites, :current_build_id
  end
end
