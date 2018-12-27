class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    clickbaits = ["Won't Believe", "Secret", "Top #{/ [0-9]*/}", "Guess"]
    if clickbaits.none? { |clickbait| title.to_s.include?(clickbait) }
      errors[:messages] = "Must be clickbait"
    end
  end
end
