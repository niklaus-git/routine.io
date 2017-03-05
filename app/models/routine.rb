class Routine < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :answers, dependent: :delete_all
  has_many :question_choices, through: :questions, dependent: :delete_all
  has_many :fields, through: :answers, dependent: :delete_all

  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }, presence: true

  def today
    self.answers.where(created_at: Time.now.beginning_of_day.utc..Time.now.end_of_day.utc).first_or_create!
  end

  def exists?(question)
    results = self.answers.joins(:fields).where(fields: { question_id: question.id })
    results.empty? ? false : true
  end
end
