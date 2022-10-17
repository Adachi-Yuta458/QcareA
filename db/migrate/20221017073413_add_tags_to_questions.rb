class AddTagsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :tags, :integer, null: false, default: 0
  end
end
