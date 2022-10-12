class AddNursingFacilityIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :nursing_facility_id, :integer
    add_index :questions, :nursing_facility_id
  end
end
