# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status, null: false, default: 0
      t.references :local_government, null: false, foreign_key: true

      t.timestamps
    end
  end
end
