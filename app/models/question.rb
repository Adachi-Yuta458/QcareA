# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :local_government

  enum status: [:wait, :working, :completed]

end
