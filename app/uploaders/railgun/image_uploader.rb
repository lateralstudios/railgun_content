# encoding: utf-8

class Railgun::ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [100, 100]
    process :quality => 80
  end

  version :large_thumb do
    process :resize_to_fill => [430, 250]
    process :quality => 80
  end

  version :polaroid do
    process :resize_to_fill => [229, 193]
    process :quality => 80
  end

  version :landscape do
    process :resize_to_fill => [1024, 600]
    process :quality => 80
  end

  version :content do
    process :resize_to_limit => [1000, 1000]
    process :quality => 80
  end

  version :banner do
    process :resize_to_fill => [1200, 140]
    process :quality => 80
  end

  version :tall_banner do
    process :resize_to_fill => [1200, 260]
    process :quality => 80
  end

  version :blog_thumb do
    process resize_to_fill: [235, 240]
    process quality: 80
  end

  version :blog_large do
    process resize_to_fill: [1200, 560]
    process quality: 80
  end

  version :author_image do
    process resize_to_fill: [40, 40]
    process quality: 80
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
