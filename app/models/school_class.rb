class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :students, foreign_key: :class_id

  validates :number, presence: true
  validates :letter, presence: true

  def students_count
    students.count
  end
end
