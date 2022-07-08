require "API/TerraResponse"
class TerraWebhook
    def initialize(res, type, user)
        @json = TerraResponse::parse(res)
        @type = type
    end
end