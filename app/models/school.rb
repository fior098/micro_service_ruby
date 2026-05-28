class School < ApplicationRecord
  has_many :school_classes, foreign_key: :school_id
  has_many :students, through: :school_classes

  validates :name, presence: true
end
