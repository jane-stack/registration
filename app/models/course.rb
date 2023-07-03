class Course < ApplicationRecord
    has_many :register_classes, dependent: :destroy
    has_many :students, through: :register_classes
end
