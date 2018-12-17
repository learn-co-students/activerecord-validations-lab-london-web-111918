class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if !title.to_s.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "not clickbaity enough")
    end
  end

end
