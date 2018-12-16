class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    clickbaits = ["Won't Believe", "Secret", "Top #{/[0-9]*/}", "Guess"]
    if title.present? && clickbaits.none? {|word| title.include?(word)}
      errors.add(:title, "is not clickbait")
    end
  end
end
