class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :users, through: :favorites
  
  def favorite(user)
    favorites.create(user_id: user.id)
  end
  
  def unfavorite(user)
    favorites.find_by(user_id: user.id).destroy
  end
  
end
