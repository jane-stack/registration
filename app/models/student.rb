class Student < ApplicationRecord
    has_secure_password

    has_many :register_classes
    has_many :courses, through: :register_classes
end
