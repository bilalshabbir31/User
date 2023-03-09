class Student < ApplicationRecord
    validates :email,:name,:last_name, presence: true
    validates :phone_no, length: {is: 11}

    def full_name
        "#{name} #{last_name}"
    end
end
