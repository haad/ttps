
CarrierWave.configure do |config|
  config.fog_credentials = {
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET']
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
    config.fog_directory = ENV['S3_BUCKET_NAME']
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
end
