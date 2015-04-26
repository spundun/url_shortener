class Short < ActiveRecord::Base
	validates :url, presence: true
end
