# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :local_government

  enum status: { wait: 0, working: 1, completed: 2 }

end
