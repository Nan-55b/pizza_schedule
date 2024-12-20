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
end