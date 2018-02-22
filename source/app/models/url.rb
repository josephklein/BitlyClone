require 'securerandom'

class Url < ActiveRecord::Base
  
  before_save :generate_url_code

  private

    def generate_url_code
      self.url_code = SecureRandom.hex[0...8]
    end

end
