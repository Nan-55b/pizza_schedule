class Task < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :user
  belongs_to :schedule
end
