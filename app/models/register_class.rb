class RegisterClass < ApplicationRecord
  belongs_to :student
  belongs_to :course
end
