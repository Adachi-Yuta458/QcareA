class LocalGovernment < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_secure_password
end
