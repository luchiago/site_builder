class CreateBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :builds do |t|
      t.text :html_build
      t.belongs_to :site
      t.timestamps
    end
  end
end
