class Comment < ActiveRecord::Base
  attr_accessible :body, :post
  belongs_to :post
  has_many :replies, dependent: :destroy

 def comment_body
    Rails.cache.fetch([:comment, post, :reply]) do
      comment.name
    end
  end
end
