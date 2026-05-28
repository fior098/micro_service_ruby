class Student < ApplicationRecord
  belongs_to :school_class, foreign_key: :class_id
  belongs_to :school

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :surname, presence: true
  validates :class_id, presence: true
  validates :school_id, presence: true
end
