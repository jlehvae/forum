Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['FORUM_GITHUB_KEY'], ENV['FORUM_GITHUB_SECRET']
end