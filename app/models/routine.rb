class Routine < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :answers, dependent: :delete_all
  has_many :question_choices, through: :questions, dependent: :delete_all
  has_many :fields, through: :answers, dependent: :delete_all

  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }, presence: true

  def today
    answer = self.answers.where(created_at: Time.now.beginning_of_day.utc..Time.now.end_of_day.utc).first_or_create!
    self.questions.each do |question|
        field = answer.new_question(question) unless answer.exists?(question)
    end
    return answer
  end

  def previous_day(date)
    answer = self.answers.where(created_at: (date - 1.day).beginning_of_day.utc..(date - 1.day).end_of_day.utc).first_or_create!
    answer.created_at = date - 1.day
    answer.save
    self.questions.each do |question|
        field = answer.new_question(question) unless answer.exists?(question)
    end
    return answer
  end

  def next_day(date)
    answer = self.answers.where(created_at: (date + 1.day).beginning_of_day.utc..(date + 1.day).end_of_day.utc).first_or_create!
    answer.created_at = date + 1.day
    answer.save
    self.questions.each do |question|
        field = answer.new_question(question) unless answer.exists?(question)
    end
    return answer
  end

  def exists?(question)
    results = self.answers.joins(:fields).where(fields: { question_id: question.id })
    results.empty? ? false : true
  end
end
