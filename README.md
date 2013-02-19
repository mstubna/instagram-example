# Instagram Example application

A demo of a simple app that uses the [Instagram gem](https://github.com/Instagram/instagram-ruby-gem)

This app demonstrates fetching several users' recent feeds, organizing each user's images by their most popular hashtags, and displaying each user's feed on an interactive page.

## Steps to Run

1. Set up the configuration file

        cp config/application.example.yml secrets/application.yml
        
2. Edit `application.yml` to reflect the appropriate Instagram configuration values for your app, specifically, the `client_id`, `client_secret`, and `access_token`. See steps below for steps for obtaining these.
3. Run these commands to try it out

        bundle
        rake db:setup
        rails s

## Steps for Obtaining Instagram App Configuration Values

1. [Register your app with Instagram](http://instagram.com/developer/clients/register/) - this will provide you with your `client_id`, `client_secret`, and `redirect_url`
2. Generate an authorization code:

        https://instagram.com/oauth/authorize/?client_id=your_client_id_&redirect_uri=your_apps_redirect_url&response_type=code

3. Generate an access token:

        curl \-F 'client_id=your_client_id' \
          -F 'client_secret=your_client_secret' \
          -F 'grant_type=authorization_code' \
          -F 'redirect_uri=your_redirect_url' \
          -F 'code=your_code'
        \https://api.instagram.com/oauth/access_token