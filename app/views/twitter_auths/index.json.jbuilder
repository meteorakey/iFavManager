json.array!(@twitter_auths) do |twitter_auth|
  json.extract! twitter_auth, :id
  json.url twitter_auth_url(twitter_auth, format: :json)
end
