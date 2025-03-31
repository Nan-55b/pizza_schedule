class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :schedules, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end

  def profile_icon
    case completed_tasks_count
    when 0..1
      'icon_stage_1.png'
    when 2..4
      'icon_stage_2.png'
    when 5..10
      'icon_stage_3.png'
    else
      'icon_stage_4.png'
    end
  end

  private

  def completed_tasks_count
    tasks.where(status: :completed).count
  end
end
