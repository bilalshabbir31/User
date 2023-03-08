class Student < ApplicationRecord
    validates :email, presence: true
end
