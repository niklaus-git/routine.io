class Answer < ApplicationRecord
  belongs_to :routine
  has_many :fields
end
