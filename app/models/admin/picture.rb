require 'carrierwave/orm/activerecord'

class Admin::Picture < ActiveRecord::Base
  self.table_name = "pictures"
  belongs_to :imageable, :polymorphic => true

  mount_uploader :image, AvatarUploader
  #
  before_destroy :remember_id
  after_destroy :remove_id_directory

protected

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/admin/picture/image/#{@id}", :force => true)
  end

end
