class OwnerMigration < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.text :notes
      t.timestamps null: true
    end
  end
end
