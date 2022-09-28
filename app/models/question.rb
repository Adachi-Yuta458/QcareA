# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :local_government

  VALID_STATUSES = ['wait', 'working', 'completed']

  validates :status, inclusion: { in: VALID_STATUSES}
end
