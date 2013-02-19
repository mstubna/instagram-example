# Instagram gem requires this initialization
Instagram.configure do |config|
  config.client_id = CONFIG[:client_id]
  config.client_secret = CONFIG[:client_secret]
  config.access_token = CONFIG[:access_token]
end