require 'Terra'

#initialize the api here
begin
    terra = TerraAPI::Terra.new(YOUR_DEV_ID, YOUR_USER_ID)
rescue TerraError => e
    puts e
end

#begin
#    test = terra.getProviders
#rescue TerraError => e
#    puts e
#else
#    puts test["status"]
#end

#begin
#    puts terra.getSubscribers
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.generateWidgetSession(
#        "",
#        ["GARMIN", "FITBIT", "OURA"],
#        "EN",
#        "https://tryterra.co",
#        "https://google.com"
#    )
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.getUser(YOUR_USER_ID)
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.deauthUser(YOUR_USER_ID)
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.getAthelete(123, true)
#rescue TerraError => e 
#    puts e
#end

#begin
#    puts terra.getActivity(YOUR_USER_ID, Time.new)
#rescue TerraError => e 
#    puts e
#end