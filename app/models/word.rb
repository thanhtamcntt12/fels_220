class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :word_detail, presence: true, length: {maximum: Settings.size_word}
end
