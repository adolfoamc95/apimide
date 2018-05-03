class Post < ApplicationRecord
  include AsJsonRepresentations
  
  belongs_to :user

  validates :description, presence: true, length: { maximum: 500 }

  representation :basic do
    {
      description: description,
      author: User.find(user_id).name,
      created_at: created_at
    }
  end
end
