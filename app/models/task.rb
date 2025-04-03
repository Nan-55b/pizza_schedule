class Task < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  enum :status, { pending: 'pending', completed: 'completed', in_progress: 'in_progress' }, suffix: true

  belongs_to :user
  belongs_to :schedule
  def own?(user)
    self.user == user
  end
end
