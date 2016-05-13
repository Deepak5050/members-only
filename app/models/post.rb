class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 2000}
end
