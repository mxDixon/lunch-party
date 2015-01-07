require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(1.hour, 'Timeout parties', :at => ['**:07', '**:17', '**:27', '**:37', '**:47', '**:57']) { QueueManager.timeout_parties }
every(1.hour, 'Regenerate parties', :at => ['**:00', '**:10', '**:20', '**:30', '**:40', '**:50']) { QueueManager.clear_and_generate }
