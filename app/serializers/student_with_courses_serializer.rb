class StudentWithCoursesSerializer < ActiveModel::Serializer
  attributes :id, :first_name

  has_many :courses
end
