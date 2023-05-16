class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances, source: :user

end
