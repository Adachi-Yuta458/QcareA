class CreateNursingFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :nursing_facilities do |t|
      t.string :name, null: false
      t.integer :local_government_id, null: false

      t.timestamps
      t.index :local_government_id
    end
  end
end
