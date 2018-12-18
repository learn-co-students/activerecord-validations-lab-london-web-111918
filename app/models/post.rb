class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbateyness

  def clickbateyness
    array = ["Won't Believe", "Secret", "Top", "Guess"]
    array.each do |phrase|
      if title.to_s.include? phrase
        return
      else
        errors.add(:title, "Not clickbatey enough! Please amend title.")
      end
    end
  end

end
