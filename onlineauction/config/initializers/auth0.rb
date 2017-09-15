Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'HmxEYWKctGnELFKJwWxwqJzeZHSGi5NV',
    '_-BUaYoYGsNo1a1NakW3-UOlMif6v-2aLZftakZ7Mw9jzbJRTjfyUi4UeAWRppm_',
    'online-auc.auth0.com',
    callback_path: "/auth/oauth2/callback"
  )
end
