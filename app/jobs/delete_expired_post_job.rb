class DeleteExpiredPostJob < ApplicationJob
  queue_as :default

  def perform
    Post.delete_expired
  end
end
