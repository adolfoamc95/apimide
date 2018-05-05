class User < ApplicationRecord
  include AsJsonRepresentations

  before_save { self.email = email.downcase }
  
  has_many :posts

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50} 
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  
  representation :basic do
    {
      id: id,
      name: name,
      email: email
    }
  end
  
end
