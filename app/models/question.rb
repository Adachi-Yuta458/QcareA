# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :local_government
  belongs_to :nursing_facility
  has_one :answer, dependent: :destroy
  has_one_attached :attachment

  enum status: { wait: 0, working: 1, completed: 2 }
  enum service: { helper: 0, helper_bath: 1, helper_nurse: 2, helper_rehab: 3, day: 4,
                  day_rehab: 5, short: 6, short_recuperation: 7, residents: 8,
                  welfare_lending: 9, welfare_selling: 10, recuperation_guidance: 11,
                  care_support: 12, special_home: 13, nursing_care_residents: 14,
                  nursing_care_clinic: 15, multifunctional: 16, night_helper: 17,
                  regular_helper: 18, day_home: 19, group_home: 20, community_residents: 21,
                  community_special_home: 22 }                 
end
