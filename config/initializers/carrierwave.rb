CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     Rails.application.secrets.config_aws_access_key_id,                        
    aws_secret_access_key: Rails.application.secrets.config_aws_secret_access_key,                        
  }
  config.fog_directory  = ENV['S3_BUCKET']                         
end