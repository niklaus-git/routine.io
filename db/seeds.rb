# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


questions = QuestionType.create([{name: 'yes/no', require_question_choices: 1},
  {name: 'short text', require_question_choices: 0},
  {name: 'long text', require_question_choices: 0},
  {name: 'multiple choice', require_question_choices: 1},
  {name: 'scale', require_question_choices: 0},
  {name: 'number', require_question_choices: 0},
  {name: 'time periods', require_question_choices: 0}
])
