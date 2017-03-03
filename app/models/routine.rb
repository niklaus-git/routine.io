class Routine < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }, presence: true
end
