class Robot < ActiveRecord::Base
  belongs_to :user
  has_many   :user_votes
  has_attached_file :image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :medium => "300x300>", :small => "200x200>" },
    :default_url => "path to default image"
  do_not_validate_attachment_file_type :image

end
