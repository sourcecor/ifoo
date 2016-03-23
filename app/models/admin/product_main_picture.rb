class Admin::ProductMainPicture < ActiveRecord::Base
  self.table_name = "product_main_pictures"
  belongs_to :product

  mount_uploader :image, AvatarUploader
  #
  before_destroy :remember_id
  after_destroy :remove_id_directory

protected

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/admin/product_main_picture/image/#{@id}", :force => true)
  end
end
