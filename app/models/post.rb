class Post < ApplicationRecord

  def self.delete_expired
    expiration_min = 30
    deadline = Time.now - expiration_min*60

    expired_posts = Post.where("created_at < ?", deadline)
    expired_posts.destroy_all
  end
end
