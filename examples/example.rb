require 'Terra'

#initialize the api here
begin
    terra = TerraAPI::Terra.new("testingAnis2", "O571xuiDDS9aGXlqro9youav9YOwD3r57YqC7bj0")
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