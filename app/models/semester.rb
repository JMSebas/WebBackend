class Semester < ApplicationRecord
    belongs_to :user, primary_key: :uuid, foreign_key: :uuid_user
    has_many :subjects
end
