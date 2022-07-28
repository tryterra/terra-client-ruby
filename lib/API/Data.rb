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

require "API/Helpers"
require 'API/TerraResponse'

module Data 
    def self.get_data(
        type,
        dev_id,
        api_key,
        api_path,
        user_id,
        startDate,
        endDate,
        to_webhook
    )
        options = {
            "headers" => {
                "X-API-Key" => api_key,
                "dev-id" => dev_id,
                "Content-Type" => "application/json",
            },
        }

        url = "#{api_path}/#{type}?user_id=#{user_id}&start_date=#{Helpers::GetTerraDate(startDate)}"
        if(endDate)
            url += "&end_date=#{Helpers::GetTerraDate(endDate)}"
        end

        url += "&to_webhook=#{to_webhook}"

        res = HTTParty.get("#{url}", :headers=>options["headers"])
        
        case res.code
            when 200
                return TerraResponse::parseBody(res)
            when 400...600
                raise TerraError.new(res)
        end
    end
end