class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :content, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  # All posts have a title
  # Post content is at least 250 characters long
  # Post summary is a maximum of 250 characters
  # Post category is either Fiction or Non-Fiction This step requires an
  # inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
  #
  # Finally, add a custom validator to Post
  # that ensures the title is sufficiently
  # clickbait-y. If the title does not contain
  # "Won't Believe", "Secret", "Top [number]",
  # or "Guess", the validator should return false.
  #
  #
  # For future projects, it's a good idea to
  # skim the list of available validation options.
  #
  # It will give you a sense of what's available
  # and help with creating validations for your
  # own model objects.

end
