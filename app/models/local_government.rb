class LocalGovernment < ApplicationRecord
  has_many :questions, dependent: :destroy
end
