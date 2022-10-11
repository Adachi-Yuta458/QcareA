class AddLocalGovernmentIdToNursingFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :nursing_facilities, :local_government_id, :integer
  end
end
