# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :local_government, null: false, foreign_key: true

      t.timestamps
    end
  end
end
