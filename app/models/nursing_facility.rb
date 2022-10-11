class NursingFacility < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :local_government
  has_secure_password
end
