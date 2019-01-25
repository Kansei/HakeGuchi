class DeleteExpiredPostJob < ApplicationJob
  queue_as :default

  def self.perform
    Post.delete_expired
  end
end
