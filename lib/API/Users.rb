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

require 'httparty'
require 'API/TerraError'
require 'API/TerraResponse'

module Users 
    def self.GetUser(devId, apiKey, api_path, userId)
        options = {
            "headers" => {
                "X-API-Key" => apiKey,
                "dev-id" => devId,
                "Content-Type" => "application/json",
            },
        }

        res = HTTParty.get(
            "#{api_path}/userInfo?user_id=#{userId}", 
            :headers=>options["headers"]
        )

        case res.code
            when 200
                return TerraResponse::parse(res)
            when 400...600
                raise TerraError.new(res)
        end
    end

    def self.DeauthUser(devId, apiKey, api_path, userId)
        options = {
            "headers" => {
                "X-API-Key" => apiKey,
                "dev-id" => devId,
                "Content-Type" => "application/json",
            },
        }

        begin
            res = HTTParty.delete("#{api_path}/auth/deauthenticateUser?user_id=#{userId}", :headers=>options["headers"])
        rescue HTTParty::Error => e
            raise TerraError.new(e)
        else 
            return TerraResponse::parse(res) 
        end
    end
end