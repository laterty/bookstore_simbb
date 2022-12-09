CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:aws_access_key],
      aws_secret_access_key: Rails.application.credentials.aws[:aws_secret_key],
      region: 'us-east-1'
    }
    config.fog_directory = Rails.application.credentials.aws[:aws_bucket]
    config.fog_public = false
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
