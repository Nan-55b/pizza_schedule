class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :tasks, dependent: :destroy
end
