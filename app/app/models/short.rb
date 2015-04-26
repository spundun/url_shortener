require 'uri'

class Short < ActiveRecord::Base
    validates :url, presence: true
    validates_each :url do |record, attrib, value|
      begin
        uri = URI.parse(value)
        raise "Incorrect protocol" unless uri.kind_of?(URI::HTTP)
      rescue
        record.errors.add(attrib, "Invalid URL, please post a valid complete URL (including the http/https part)")
      end
    end
end
