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

- `getAtheletes(userId:string, toWebhook:boolean_optional)`
- `generateWidgetSession(
            referenceId:string,
            providers:array_of_string,
            language:string,
            auth_success_redirect_url:string,
            auth_failure_redirect_url:string
   )`
- `getProviders`
- `getSubscribers`
- `getUser(userId:string)`
- `deauthUser(userId:string)`
- `getActivity( 
      userId:string, 
      start_date:date, 
      end_date:date_optional, 
      toWebhook:boolean_optional
  )`
- `getDaily( 
      userId:string, 
      start_date:date, 
      end_date:date_optional, 
      toWebhook:boolean_optional
  )`
- `getBody( 
      userId:string, 
      start_date:date, 
      end_date:date_optional, 
      toWebhook:boolean_optional
  )`
- `getSleep( 
      userId:string, 
      start_date:date, 
      end_date:date_optional, 
      toWebhook:boolean_optional
  )`
- `getMenstruation( 
      userId:string, 
      start_date:date, 
      end_date:date_optional, 
      toWebhook:boolean_optional
  )`
- `parseWebhook(payload:object, type:string, userId:string_optional)`

In addition, all the data models documented on https://docs.tryterra.co/data-models are available to import and use.
