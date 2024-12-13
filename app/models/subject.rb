class Subject < ApplicationRecord
  belongs_to :semester
  belongs_to :schedule
  has_many :assignments
end
