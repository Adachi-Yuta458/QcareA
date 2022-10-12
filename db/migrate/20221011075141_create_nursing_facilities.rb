class CreateNursingFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :nursing_facilities do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
