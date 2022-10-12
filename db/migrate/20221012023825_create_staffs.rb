class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :nursing_facility_id, null: false
      t.string :password_digest

      t.timestamps
      t.index :email, unique: true
      t.index :nursing_facility_id
    end
  end
end
