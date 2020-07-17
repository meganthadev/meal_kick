Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["979805409299-ks0nb7e1rudge5cbbect9vrforlfnua0.apps.googleusercontent.com"], ENV["mMhLG4-NqUHaeUDzuwZCl3ed"],
    scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
end

