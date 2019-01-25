require 'clockwork'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.minutes, 'DeleteExpiredPost') { DeleteExpiredPostJob.perform }
end
