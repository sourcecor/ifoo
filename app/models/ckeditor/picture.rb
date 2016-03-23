class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CkeditorPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end

  # 
  before_destroy :remember_id
  after_destroy :remove_id_directory

protected

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/ckeditor/pictures/#{@id}", :force => true)
  end
end
