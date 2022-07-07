require_relative '../lib/Terra'

#initialize the api here
begin
    terra = TerraAPI::Terra.new(YOUR_DEV_ID, YOUR_API_KEY)
rescue TerraError => e
    puts e
end

#begin
#    puts terra.getProviders
#rescue TerraError => e
#    puts e
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
#    puts terra.getAthelete(YOUR_USER_ID, false)
#rescue TerraError => e 
#    puts e
#end

#begin
#    puts terra.getActivity(YOUR_USER_ID, Time.new)
#rescue TerraError => e 
#    puts e
#end