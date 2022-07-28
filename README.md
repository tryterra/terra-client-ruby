# Terra Ruby Package

A wrapper in ruby for the Terra endpoints and models.


Install using

```sh
gem install tryterra-client
```

Then import the `TerraAPI` class from Terra

Initialise a new TerraAPI instance with:

```rb
begin
    terra = TerraAPI::Terra.new(YOUR_DEV_ID, YOUR_API_KEY)
rescue TerraError => e
    # Handle errors here
end
```

Now you can call the following functions from the instance:

- `get_atheletes(user_id:string, to_webhook:boolean_optional)`
- `generate_widget_session(
            reference_id:string,
            providers:array_of_string,
            language:string,
            auth_success_redirect_url:string,
            auth_failure_redirect_url:string
   )`
- `get_providers`
- `get_subscribers`
- `get_user(user_id:string)`
- `deauthUser(user_id:string)`
- `get_activity( 
      user_id:string, 
      start_date:date, 
      end_date:date_optional, 
      to_webhook:boolean_optional
  )`
- `get_daily( 
      user_id:string, 
      start_date:date, 
      end_date:date_optional, 
      to_webhook:boolean_optional
  )`
- `get_body( 
      user_id:string, 
      start_date:date, 
      end_date:date_optional, 
      to_webhook:boolean_optional
  )`
- `get_sleep( 
      user_id:string, 
      start_date:date, 
      end_date:date_optional, 
      to_webhook:boolean_optional
  )`
- `get_menstruation( 
      user_id:string, 
      start_date:date, 
      end_date:date_optional, 
      to_webhook:boolean_optional
  )`
- `parse_webhook(payload:object, type:string, user_id:string_optional)`

In addition, all the data models documented on https://docs.tryterra.co/data-models are available to import and use.

## Example

```rb
require 'Terra'

begin
    terra = TerraAPI::Terra.new(YOUR_DEV_ID, YOUR_API_KEY)
rescue TerraError => e
    # Handle errors here
end

begin
    puts terra.getProviders # will display a list of available providers
rescue TerraError => e
    # Handle errors here
end
```

The result will be
```
{"status"=>"success", "providers"=>["FITBIT", "OURA", "TRAININGPEAKS", "WITHINGS", "SUUNTO", "PELOTON", "ZWIFT", "GARMIN", "EIGHT", "WAHOO", "GOOGLE", "POLAR", "WEAROS", "FREESTYLELIBRE", "TEMPO", "IFIT", "CONCEPT2", "FATSECRET", "CRONOMETER", "MYFITNESSPAL", "NUTRACHECK", "UNDERARMOUR", "OMRON", "RENPHO", "DEXCOM"]}
```
