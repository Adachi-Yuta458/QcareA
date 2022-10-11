class AddServiceToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :service, :integer
  end
end
