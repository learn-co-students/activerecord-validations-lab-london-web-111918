class MyValidator < ActiveModel::Validator
  def validate(posts)
    if posts.title.present? && !["Won't Believe", "Secret", "Top", "Guess"].any? { |string|
       posts.title.include?(string) }
       posts.errors.add(:title, "Must be clickbait")
     end
   end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :title, presence: true
    validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
end
