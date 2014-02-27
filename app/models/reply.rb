class Reply < ActiveRecord::Base
  attr_accessible :comment, :body
  belongs_to :comment

  def reply_body
    Rails.cache.fetch([:reply, body, :comment]) do
      reply.name
    end
  end
end
