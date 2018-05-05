class Post < ApplicationRecord
  include AsJsonRepresentations
  
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :description, presence: true, length: { maximum: 500 }

  representation :basic do
    {
      description: description,
      author: User.find(user_id).name,
      image: image,
      created_at: created_at
    }
  end
end
