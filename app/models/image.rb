class Image < ActiveRecord::Base
  # TODO: Remove images from s3 when they're destroyed

  belongs_to :imageable, :polymorphic => true
  belongs_to :user

  has_one :original_image, :as => :imageable, :class_name => "Image"

  DEFAULT_AVATAR_PATH = Rails.root.join("app/assets/images/avatar.png")

  acts_as_list scope: [:imageable_id, :imageable_type]

  if Rails.env.production?
    has_attached_file :file,
      :path => "#{ENV_NAME}/:class/:id/:basename_:style.:extension",
      :styles => { :small => "100x100^", :medium => "600" }
  else
    has_attached_file :file,
      :path => ":rails_root/public/#{ENV_NAME}/:class/:id/:basename_:style.:extension",
      :url => "/#{ENV_NAME}/:class/:id/:basename_:style.:extension",
      :styles => { :small => "100x100^", :medium => "600" }
  end

  def urls
    {
      :small => file.url(:small),
      :medium => file.url(:medium),
      :original => file.url
    }
  end

  def self.clean_old_images
    Image.where("created_at < ? AND imageable_id = ?", 7.days.ago, nil).destroy_all
  end

  def serializable_hash(options)
    options ||= {}
    options = {
      :methods => [ :urls ]
    }.update(options)
    super(options)
  end

  before_create :randomize_file_name

  private

  def randomize_file_name
    extension = File.extname(file_file_name).downcase
    self.file.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
  end
end

