require 'json'
module TerraResponse
    def self.parseBody(response)
        return JSON.parse(response.body)
    end

    def self.parseResponse(response)
        return JSON.parse(response)
    end
        
end