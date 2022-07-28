require 'Terra'

#initialize the api here
begin
    terra = TerraAPI::Terra.new(YOUR_DEV_ID, YOUR_API_KEY)
rescue TerraError => e
    puts e
end

begin
    test = terra.get_providers
rescue TerraError => e
    puts e
else
    puts test
end

begin
    puts terra.get_subscribers
rescue TerraError => e
    puts e
end

#begin
#    puts terra.generate_widget_session(
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
#    puts terra.get_user(YOUR_USER_ID)
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.deauth_user(YOUR_USER_ID)
#rescue TerraError => e
#    puts e
#end

#begin
#    puts terra.get_athelete(YOUR_USER_ID)
#rescue TerraError => e 
#    puts e
#end

#begin
#    puts terra.get_activity(YOUR_USER_ID, Time.new)
#rescue TerraError => e 
#    puts e
#end