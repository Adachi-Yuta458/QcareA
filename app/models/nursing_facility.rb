class NursingFacility < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :staffs, dependent: :destroy
  belongs_to :local_government
end
