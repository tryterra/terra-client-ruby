#  Copyright 2022 Terra Enabling Developers Limited
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

require "httparty"
require "API/Athelete"
require "API/GenerateWidgetSession"
require "API/Providers"
require "API/Subscribers"
require "API/Users"
require "API/Data"
require "API/Helpers"


module TerraAPI 
    class Terra
        def initialize(devId, apiKey)
            @api_path = "https://api.tryterra.co/v2"

            options = {
                "headers" => {
                    "X-API-Key" => apiKey,
                    "dev-id" => devId,
                    "Content-Type" => "application/json",
                },
            }

            res = HTTParty.get("#{@api_path}/subscriptions", :headers=>options["headers"])
            case res.code
                when 200
                    @apiKey = apiKey
                    @devId = devId
                    puts "Successfuly connected to the API"
                when 400...600
                    raise TerraError.new(res)
            end
        end

        def getAthelete(userId, toWebhook)
            return Athelete::Get(@devId, @apiKey, @api_path, userId, toWebhook,)
        end

        def generateWidgetSession(
            referenceId,
            providers,
            language,
            auth_success_redirect_url,
            auth_failure_redirect_url
        )
            return GWS::GenerateWidgetSession(
                @devId,
                @apiKey,
                @api_path,
                referenceId,
                providers,
                language,
                auth_success_redirect_url,
                auth_failure_redirect_url
            )
        end

        def getProviders()
            return Provider::GetProviders(@devId, @apiKey, @api_path)
        end

        def getSubscribers()
            return Subscribers::GetSubscribers(@devId, @apiKey, @api_path)
        end

        def getUser(userId)
            return Users::GetUser(@devId, @apiKey, @api_path, userId)
        end

        def deauthUser(userId)
            return Users::DeauthUser(@devId, @apiKey, @api_path, userId)
        end

        private def getData(type, userId, start_date, end_date, toWebhook)
            return Data::GetData(type, @devId, @apiKey, @api_path, userId, start_date, end_date, toWebhook)
        end

        def getActivity(userId, start_date, end_date=nil, toWebhook=nil)
            return getData("activity", userId, start_date, end_date, toWebhook)
        end

        def getDaily(userId, start_date, end_date=nil, toWebhook=nil)
            return getData("daily", userId, start_date, end_date, toWebhook)
        end

        def getBody(userId, start_date, end_date=nil, toWebhook=nil)
            return getData("body", start_date, end_date, toWebhook)
        end

        def getSleep(userId, start_date, end_date=nil, toWebhook=nil)
            return getData("sleep", userId, start_date, end_date, toWebhook)
        end

        def getMenstruation(userId, start_date, end_date=nil, toWebhook=nil)
            return getData("menstruation", userId, start_date, end_date, toWebhook)
        end
    end
end

