require 'securerandom'
require 'net/http'
require 'uri'

class Url < ActiveRecord::Base
  
  before_save :generate_url_code
  validates :full_url, 
    presence: {message: "The URL was blank!"},
    format: { with: /https:\/\/|http:\/\//, message: "The URL must start with http:// or https://"}
  validate :url_responds 

  private

    def generate_url_code
      if self.url_code.nil?
        self.url_code = SecureRandom.hex[0...8]
      end
    end

    def url_responds
      begin
        uri = URI.parse self.full_url
        response_code = Net::HTTP.get_response(uri).code
        if response_code.start_with? "4"
          errors.add(:full_url, "The URL doesn't respond")
        end
      rescue
        errors.add(:full_url, "The URL doesn't respond")
      end
    end

end
