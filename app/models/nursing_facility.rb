class NursingFacility < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :local_government
end
