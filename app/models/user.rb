class User < ApplicationRecord
    has_many :semesters, primary_key: :uuid, foreign_key: :uuid_user

end
