class Post < ApplicationRecord
  belongs_to :user

  validates :description, presence: true, length: { maximum: 500 }
end
