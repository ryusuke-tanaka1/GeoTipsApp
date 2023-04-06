class ImgUploaderUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    '【4K対応PC版】2023年4月メンバー限定壁紙.jpg'
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end