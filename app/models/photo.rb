class Photo
  include Mongoid::Document
  field :title, type: String
  mount_uploader :image, AvatarUploader

  belongs_to :user
end
