require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(1.day, 'Timeout parties', :at => %w(11:07, 11:17, 11:27, 11:37, 11:47, 11:57, 12:07, 12:17, 12:27, 12:37, 12:47, 12:57, 1:07, 1:17, 1:27, 1:37, 1:47)) { QueueManager.timeout_parties }
every(1.day, 'Regenerate parties', :at => %w(11:01, 11:10, 11:20, 11:30, 11:40, 11:50, 12:00, 12:10, 12:20, 12:30, 12:40, 12:50, 1:00, 1:10, 1:20, 1:30, 1:40, 1:50)) { QueueManager.clear_and_generate }
every(1.day, 'Closing horn', :at => %w(1:58)) { QueueManager.day_close }

