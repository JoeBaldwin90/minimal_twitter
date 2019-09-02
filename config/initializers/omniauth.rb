Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "OuyD2ohfHuUDfpA0BJoVNj2fL", "uJbKjucwV0kEaiMaskpWOsOmlOM62ArRquH9dxaDG2T7by6zii",
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'en-gb'
      }
    }
end
