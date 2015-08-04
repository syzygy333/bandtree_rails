class Band < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :portrait, PortraitUploader
end
