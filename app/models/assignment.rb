class Assignment < ApplicationRecord
  belongs_to :subject
  has_many :resources
end
