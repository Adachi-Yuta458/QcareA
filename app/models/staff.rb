class Staff < ApplicationRecord
  belongs_to :nursing_facility
  has_secure_password
end
