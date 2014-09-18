class Party < ActiveRecord::Base
	has_many :people,
	:status, 
	:maxSize,
	:minSize,
end
