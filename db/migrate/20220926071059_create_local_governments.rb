# frozen_string_literal: true

class CreateLocalGovernments < ActiveRecord::Migration[6.1]
  def change
    create_table :local_governments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
